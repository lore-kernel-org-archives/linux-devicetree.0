From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 1/9] pinctrl: mvebu: pinctrl driver core
Date: Tue, 11 Sep 2012 16:17:13 -0600
Message-ID: <504FB869.60201@wwwdotorg.org>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347266386-16229-2-git-send-email-sebastian.hesselbarth@gmail.com> <20120911164409.4c030bd8@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120911164409.4c030bd8@skate>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Lior Amsalem <alior@marvell.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Ben Dooks <ben.dooks@codethink.co.uk>, Rob Landley <rob@landley.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/11/2012 08:44 AM, Thomas Petazzoni wrote:
> Hello Sebastian,
>=20
> Sorry for getting back to you so late about this patch set. I have be=
en
> very busy with other things.
>=20
> Le Mon, 10 Sep 2012 10:39:38 +0200,
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> a =C3=A9crit =
:
>=20
>> v3:
>> - list of functions is now built out of pin groups passed to core dr=
iver
>>   instead of parsing DT node.
>=20
> Even though I have gone through your discussion with Stephen Warren o=
n
> this, I don't get what you have done exactly, and I'm even more puzzl=
ed
> by the following piece of code:
>=20
>> +static int __devinit _add_function(const char **funcs, const char *=
name)
>> +{
>> +	int n =3D 0;
>> +
>> +	while (funcs[n]) {
>> +		/* function already there */
>> +		if (strcmp(funcs[n], name) =3D=3D 0)
>> +			return -EEXIST;
>> +		n++;
>> +	}
>> +	funcs[n] =3D name;
>> +	return 0;
>> +}
>> +
>> +static int __devinit mvebu_pinctrl_build_functions(struct platform_=
device *pdev,
>> +						   struct mvebu_pinctrl *pctl)
>> +{
>> +	const char **prefunc =3D kzalloc(sizeof(char *), GFP_KERNEL);
>> +	int num =3D 0;
>> +	int n, s;
>> +
>> +	for (n =3D 0; n < pctl->num_groups; n++) {
>> +		struct mvebu_pinctrl_group *grp =3D &pctl->groups[n];
>> +		for (s =3D 0; s < grp->num_settings; s++) {
>> +			/* skip unsupported settings on this variant */
>> +			if (pctl->variant &&
>> +			    !(pctl->variant & grp->settings[s].variant))
>> +				continue;
>> +
>> +			/* check for unique functions */
>> +			if (_add_function(prefunc, grp->settings[s].name))
>> +				continue;
>> +
>> +			num++;
>> +		}
>> +	}
>> +	return 0;
>> +}
>=20
> What is this supposed to do? It allocates an array prefunc, whose
> reference is only stored in a local variable, and anywhere else, so
> basically it does nothing except leaking memory unless I got it wrong=
=2E

I imagine this is related to the way that the SoC-specific drivers
provide their configuration to the generic core driver. I'm not sure th=
e
data structures used for this purpose are the best design.

The pinctrl core expects lists of:

* Pins

* Groups of pins (each being a name and an array of pins in the group)

* Functions that can be muxed onto the groups (each function being a
global entity rather than something with a pin or group, and each
function being a name, and an array of groups where the function can be
selected).

However, the drivers in this patch seem to invert the data-structures a
little - in other words, instead of defining a global list of functions=
,
they define a list of groups, and for each group, list the functions
that can be selected on to it.

In turn, that probably requires the core mvebu driver to invert these
data-structures at run-time in order to provide the data the pinctrl
core needs. I think it'd be better to just have each SoC-specific drive=
r
store the data tables in the same format that the pinctrl core needs it=
,
so that the mvebu pinctrl core won't have to process the data-structure=
s
at all.

In particular, the following data structure is what I'm talking about:

+static struct mvebu_mpp_mode dove_mpp_modes[] =3D {
+	MPP_MODE(0,
+		MPP_FUNCTION(0x00, "gpio", NULL),
+		MPP_FUNCTION(0x02, "uart2", "rts"),
+		MPP_FUNCTION(0x03, "sdio0", "cd"),
+		MPP_FUNCTION(0x0f, "lcd0", "pwm"),
+		MPP_FUNCTION(0x10, "pmu", NULL)),

it's defining the functions within the context of a particular group
("mode" in the drivers terminology, I think...) rather than defining
functions and groups as separate top-level tables.
