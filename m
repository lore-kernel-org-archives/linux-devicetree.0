Return-Path: <SRS0=2DMd=5Y=goldelico.com=hns@kernel.org>
Content-Type: multipart/alternative; boundary="Apple-Mail=_D1F0C594-E136-46B9-AA39-5ACC45F541B9"
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v6 3/4] power: supply: twl4030-charger: move irq allocation to just before irqs are enabled
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20170615114704.odpislk5a4nsigtv@earth>
Date: Mon, 19 Jun 2017 10:41:14 +0200
Message-Id: <BFA9DCA4-7AB7-455C-B496-7033B083DE56@goldelico.com>
References: <cover.1497432355.git.hns@goldelico.com> <0eeffa7a6ab8e4213f518e2caf6982d2b77dc0b2.1497432355.git.hns@goldelico.com> <20170615114704.odpislk5a4nsigtv@earth>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, NeilBrown <neil@brown.name>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Marek Belisko <marek@goldelico.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, letux-kernel@openphoenux.org, notasas@gmail.com, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_D1F0C594-E136-46B9-AA39-5ACC45F541B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Sebastian,

> Am 15.06.2017 um 13:47 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.co.uk>:
>=20
> Hi,
>=20
> On Wed, Jun 14, 2017 at 11:25:55AM +0200, H. Nikolaus Schaller wrote:
>> This avoids a potential race if irqs are enabled and triggered too =
early
>> before the worker is properly set up.
>>=20
>> Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/power/supply/twl4030_charger.c | 28 =
++++++++++++++--------------
>> 1 file changed, 14 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/drivers/power/supply/twl4030_charger.c =
b/drivers/power/supply/twl4030_charger.c
>> index 1fbbe0cc216a..3bebeecb4a1f 100644
>> --- a/drivers/power/supply/twl4030_charger.c
>> +++ b/drivers/power/supply/twl4030_charger.c
>> @@ -984,6 +984,16 @@ static int twl4030_bci_probe(struct =
platform_device *pdev)
>>=20
>> 	platform_set_drvdata(pdev, bci);
>>=20
>> +	if (bci->dev->of_node) {
>> +		struct device_node *phynode;
>> +
>> +		phynode =3D =
of_find_compatible_node(bci->dev->of_node->parent,
>> +						  NULL, =
"ti,twl4030-usb");
>> +		if (phynode)
>> +			bci->transceiver =3D devm_usb_get_phy_by_node(
>> +				bci->dev, phynode, &bci->usb_nb);
>> +	}
>> +
>=20
> The notifier is not that much different from an irq. I see
> the call can access at least the iio channel (so iio channel
> should be registered first).

Hm. I only see that it can schedule the worker (which means the worker =
should be
initialized first) but does not access iio by itself.

Can the worker run before probe() succeeds?

> I suspect worker and power-supply
> should also be initialized/registered first. Best location seems
> to be directly before requesting the irqs.

I think they should be initialized even before =
devm_usb_get_phy_by_node().

>=20
>> 	bci->channel_vac =3D devm_iio_channel_get(&pdev->dev, "vac");
>> 	if (IS_ERR(bci->channel_vac)) {
>> 		bci->channel_vac =3D NULL;
>> @@ -1006,6 +1016,10 @@ static int twl4030_bci_probe(struct =
platform_device *pdev)
>> 		return ret;
>> 	}
>>=20
>> +	INIT_WORK(&bci->work, twl4030_bci_usb_work);
>> +	INIT_DELAYED_WORK(&bci->current_worker, twl4030_current_worker);
>> +
>> +	bci->usb_nb.notifier_call =3D twl4030_bci_usb_ncb;
>=20
> You should configure the notifier block *before* registering it.

Isn't the notifier block already configured by =
devm_usb_get_phy_by_node() - except for the pointer to the =
notifier_call?

So the only harmful thing I can see is that a notifier arrives with =
usb_nb.notifier_call still being uninitialized as NULL.

Is this harmful or not? I don't know.

I can only guess that it could equally well be set right after =
devm_usb_get_phy_by_node()
and I have reworked it that way.

It still works on GTA04 and OpenPandora with neither observing a =
regression nor an improvement.

So I will send a v7 with what I think should be most robust.

BR and thanks,
Nikolaus


--Apple-Mail=_D1F0C594-E136-46B9-AA39-5ACC45F541B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Sebastian,<div class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">Am 15.06.2017 um 13:47 schrieb Sebastian =
Reichel &lt;<a href=3D"mailto:sebastian.reichel@collabora.co.uk" =
class=3D"">sebastian.reichel@collabora.co.uk</a>&gt;:<br class=3D""><br =
class=3D"">Hi,<br class=3D""><br class=3D"">On Wed, Jun 14, 2017 at =
11:25:55AM +0200, H. Nikolaus Schaller wrote:<br class=3D""><blockquote =
type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">This =
avoids a potential race if irqs are enabled and triggered too early<br =
class=3D"">before the worker is properly set up.<br class=3D""><br =
class=3D"">Suggested-by: Grygorii Strashko &lt;<a =
href=3D"mailto:grygorii.strashko@ti.com" =
class=3D"">grygorii.strashko@ti.com</a>&gt;<br class=3D"">Signed-off-by: =
H. Nikolaus Schaller &lt;<a href=3D"mailto:hns@goldelico.com" =
class=3D"">hns@goldelico.com</a>&gt;<br class=3D"">---<br =
class=3D"">drivers/power/supply/twl4030_charger.c | 28 =
++++++++++++++--------------<br class=3D"">1 file changed, 14 =
insertions(+), 14 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/drivers/power/supply/twl4030_charger.c =
b/drivers/power/supply/twl4030_charger.c<br class=3D"">index =
1fbbe0cc216a..3bebeecb4a1f 100644<br class=3D"">--- =
a/drivers/power/supply/twl4030_charger.c<br class=3D"">+++ =
b/drivers/power/supply/twl4030_charger.c<br class=3D"">@@ -984,6 +984,16 =
@@ static int twl4030_bci_probe(struct platform_device *pdev)<br =
class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>platform_set_drvdata(pdev, =
bci);<br class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (bci-&gt;dev-&gt;of_node) {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>struct device_node *phynode;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>phynode =3D=
 of_find_compatible_node(bci-&gt;dev-&gt;of_node-&gt;parent,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&nbsp;&nbsp;NULL, "ti,twl4030-usb");<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(phynode)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bci-&gt;transceiver =3D =
devm_usb_get_phy_by_node(<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bci-&gt;dev, phynode, =
&amp;bci-&gt;usb_nb);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+<br =
class=3D""></blockquote><br class=3D"">The notifier is not that much =
different from an irq. I see<br class=3D"">the call can access at least =
the iio channel (so iio channel<br class=3D"">should be registered =
first).</blockquote><div class=3D""><br class=3D""></div>Hm. I only see =
that it can schedule the worker (which means the worker should =
be</div><div class=3D"">initialized first) but does not access iio by =
itself.</div><div class=3D""><br class=3D""></div><div class=3D"">Can =
the worker run before probe() succeeds?</div><div class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""> I suspect worker and =
power-supply<br class=3D"">should also be initialized/registered first. =
Best location seems<br class=3D"">to be directly before requesting the =
irqs.<br class=3D""></blockquote><div class=3D""><br class=3D""></div>I =
think they should be initialized even before =
devm_usb_get_phy_by_node().</div><div class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>bci-&gt;channel_vac =3D devm_iio_channel_get(&amp;pdev-&gt;dev, =
"vac");<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (IS_ERR(bci-&gt;channel_vac)) =
{<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>bci-&gt;channel_vac =3D NULL;<br class=3D"">@@ -1006,6 +1016,10 =
@@ static int twl4030_bci_probe(struct platform_device *pdev)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return ret;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>INIT_WORK(&amp;bci-&gt;work, twl4030_bci_usb_work);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>INIT_DELAYED_WORK(&amp;bci-&gt;current_worker, =
twl4030_current_worker);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>bci-&gt;usb_nb.notifier_call =3D twl4030_bci_usb_ncb;<br =
class=3D""></blockquote><br class=3D"">You should configure the notifier =
block *before* registering it.<br class=3D""></blockquote><div =
class=3D""><br class=3D""></div>Isn't the notifier block already =
configured by devm_usb_get_phy_by_node() - except for the pointer to the =
notifier_call?</div><div class=3D""><br class=3D""></div><div =
class=3D"">So the only harmful thing I can see is that a notifier =
arrives with usb_nb.notifier_call still being uninitialized as =
NULL.</div><div class=3D""><br class=3D""></div><div class=3D"">Is this =
harmful or not? I don't know.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I can only guess that it could equally =
well be set right after devm_usb_get_phy_by_node()</div><div =
class=3D"">and I have reworked it that way.</div><div class=3D""><br =
class=3D""></div><div class=3D"">It still works on GTA04 and OpenPandora =
with neither observing a regression nor an improvement.</div><div =
class=3D""><br class=3D""></div><div class=3D"">So I will send a v7 with =
what I think should be most robust.</div><div class=3D""><br =
class=3D""></div><div class=3D"">BR and thanks,</div><div =
class=3D"">Nikolaus</div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_D1F0C594-E136-46B9-AA39-5ACC45F541B9--
