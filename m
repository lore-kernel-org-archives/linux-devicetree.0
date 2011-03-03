From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] hwmon: (ads1015) Add devicetree documentation
Date: Thu, 3 Mar 2011 15:09:28 -0700
Message-ID: <AANLkTikXzJEAYg7+5ekMzTj_V-Hs63Psgru4Vc_QGhRy@mail.gmail.com>
References: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
 <20110303115151.GF3649@pengutronix.de> <20110303132025.51e0d92e@endymion.delvare>
 <20110303132549.GG3649@pengutronix.de> <20110303172653.GB22940@angua.secretlab.ca>
 <20110303230253.0e8455c2@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20110303230253.0e8455c2@endymion.delvare>
Sender: linux-doc-owner@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Dirk Eibach <eibach@gdsys.de>, devicetree-discuss@lists.ozlabs.org, rdunlap@xenotime.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2011 at 3:02 PM, Jean Delvare <khali@linux-fr.org> wrote=
:
> On Thu, 3 Mar 2011 10:26:53 -0700, Grant Likely wrote:
>> On Thu, Mar 03, 2011 at 02:25:49PM +0100, Wolfram Sang wrote:
>> > OK. The thing is you can't map platform_data 1:1 to bindings, beca=
use
>> > most are very specific to the Linux-driver. Do you think something=
 like
>> > "active-channels" would be sufficent for those other hwmon devices=
, too?
>> > (I still do not like "exported-channels", because there is no need=
 to
>> > export the channels for the OS. The devicetree is primarily a hard=
ware
>> > description language) Or maybe we go specific and say "ads1015,cha=
nnel1
>> > =3D 1"? Maybe somebody knows of a similar chips as a reference?
>>
>> Yes, Wolfram's correct. =A0The focus should be on what the connectio=
ns
>> actually are instead of what the OS should attempt to do with them.
>> ie. give the active channels actual names for what they do, or use a
>> phandle to reference them from another node. =A0The driver can then =
make
>> a decision based on whether or not a channel has a configuration
>> provided.
>>
>> From the little information I have, I'd recommend something like:
>>
>> sensor@49 {
>> =A0 =A0 =A0 compatible =3D "ti,ads1015"
>> =A0 =A0 =A0 reg =3D <0x49>;
>>
>> =A0 =A0 =A0 // Each child node (one node per channel) has an address=
 with
>> =A0 =A0 =A0 // no range
>> =A0 =A0 =A0 #address-cells =3D <1>;
>> =A0 =A0 =A0 #size-cells =3D <0>;
>>
>> =A0 =A0 =A0 adc@2 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ti,measurement =3D "cpu voltage";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <2>;
>> =A0 =A0 =A0 };
>>
>> =A0 =A0 =A0 adc@4 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ti,measurement =3D "base voltage";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <4>;
>> =A0 =A0 =A0 };
>> };
>>
>> However, after taking a little look at the data sheet, this binding
>> might end up being a little naive for what the part can do. =A0It mi=
ght
>> make more sense to do something like:
>>
>> sensor@49 {
>> =A0 =A0 =A0 compatible =3D "ti,ads1015"
>> =A0 =A0 =A0 reg =3D <0x49>;
>>
>> =A0 =A0 =A0 // Each child node (one node per channel) has an address=
 with
>> =A0 =A0 =A0 // no range
>> =A0 =A0 =A0 #address-cells =3D <1>;
>> =A0 =A0 =A0 #size-cells =3D <0>;
>>
>> =A0 =A0 =A0 measurement@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>; =A0 =A0 =A0// This reg valu=
e no longer reflects
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 // the c=
hip, it's just a handle for
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 // logic=
al measurement channels
>
> If there any hard requirement for this? From the driver's perspective=
,
> the multiplexer setting can be used as the channel ID, and it's easie=
r
> this way than using arbitrary identifiers.

Nope, not a hard requirement.  Just a suggestion.  It would be
valuable if (and only if) there was ever reason to have more than one
configuration for a particular multiplexer setting.

>> It's more verbose than a single exported-channels property, but it i=
s
>> flexible enough that it can be easily extended with extra
>> configuration data per channel.
>
> I will leave it up to Dirk to decide how much time he wants to spend =
on
> this. He has already been very patient with the driver review process
> and I do not want to abuse his patience.

BTW Dirk, I'm happy to help show how to write the parser code for the
sub-node approach if you need it.

g.
