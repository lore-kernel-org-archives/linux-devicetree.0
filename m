From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Fri, 07 Feb 2014 14:53:48 +0100
Message-ID: <52F4E56C.4030500@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com> <1390426587-16287-3-git-send-email-hdegoede@redhat.com> <20140127144349.GJ3867@lukather> <52E67316.5020906@redhat.com> <20140128094427.GZ3867@lukather> <52E77FCD.5050701@redhat.com> <20140204094051.GL25625@lukather> <52F0BD94.1060601@redhat.com> <20140207134831.GJ3192@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB5GK2OLQKGQEDVE5N6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140207134831.GJ3192@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/07/2014 02:48 PM, Maxime Ripard wrote:
> On Tue, Feb 04, 2014 at 11:14:44AM +0100, Hans de Goede wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> On 02/04/2014 10:40 AM, Maxime Ripard wrote:
>>> Hi Hans,
>>>
>>> On Tue, Jan 28, 2014 at 11:00:45AM +0100, Hans de Goede wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>>
>>>> Hi,
>>>>
>>>> On 01/28/2014 10:44 AM, Maxime Ripard wrote:
>>>>> On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
>>>>>>>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A1=
3
>>>>>>>
>>>>>>> Maybe we can just remove the gates from there? Even though they are=
 gates, they are also (a bit) more than that.
>>>>>>
>>>>>> To be clear you mean s/usb-gates-clk/usb-clk/ right ?
>>>>>
>>>>> Yep, exactly
>>>>>
>>>>>>> I guess that means that we will have the OHCI0 gate declared with <=
&...-gates-clk 6>, while it's actually the first gate for this clock?
>>>>>>
>>>>>> Correct.
>>>>>>
>>>>>>> Maybe introducing an offset field in the gates_data would be a good=
 idea, so that we always start from indexing the gates from 0 in the DT?
>>>>>>
>>>>>> Well for the other "gates" type clks we also have holes in the range=
, and we always refer to the clk with the bit number in the reg as the cloc=
k-cell value.
>>>>>
>>>>> Yes, we have holes, but I see two majors differences here: - the othe=
r gates are just gates, while the usb clocks are a bit more than that.
>>>>
>>>> The usb-clk registers contain more then that, but the bits we are talk=
ing about now are gates.
>>>>
>>>>> - the other gates' gating bits thus all start at bit 0, while - here,=
 since it's kind of a "mixed" clock, the gating bits start - at bit 6 (on t=
he A20 at least)
>>>>
>>>> Right, still I believe that the consistent thing to do is keeping the =
bit-number for the bit in the register controlling the gate as the specifie=
r.  When adding new dts entries / reviewing existing ones I'm used to match=
ing the specifier to the bit-nr in the data-sheet, I think making things di=
fferent just for this one register is counter productive.
>>>
>>> And if you turn it the other way around, it would be inconsistent that =
all gates indices start at 0, and we would start at 6 here :)
>>
>> I think the problem here is that you see the specifier part of the clk
>> phandle as an index, which it is not. All devicetree docs / code talks
>> about specifiers or arguments not indexes. Once you stop seeing this as
>> an index, you will hopefully also stop insisting this needs to
>> start at 0 :)
>>
>> Also note that it already is not an index for existing sunxi clks which =
have
>> cells !=3D 0, as there are holes in the bits used in the gates registers=
 and
>> calling the specifier an index suggest we're dealing with an array, and
>> arrays never have holes.
>>
>> The clk specifier as currently used in sunxi clks is a 1:1 mapping of th=
e
>> gate register bit numbers, as is clearly documented in ie:
>> Documentation/devicetree/bindings/clock/sunxi/sun4i-a10-gates.txt
>> Where the datasheet is referenced as the source for (most) of the values
>> to put in the specifier.
>>
>> My biggest objection is that this would loose 1:1 mapping we currently
>> have between the specifier and bit-nr in the register, which really is
>> convenient when writing new dts bindings.
>>
>> When we add an offset users will need to first lookup which clk they nee=
d in
>> the datasheet and then look at both the dts bindings doc to find how thi=
s is
>> mapped to the specifier. In my experience such an extra level of indirec=
tion
>> in documentation is a PITA, and all that just so that some random number
>> (it is not an index!) can start at 0 ?
>>
>> To me adding an offset here and making the clk gates different form all
>> our other clock gates just feels wrong.
>
> Emilio pretty much share your feeling. I won't get in the way then :)
>
> I only had the compatible name comment left then.

Yes I've already fixed that in my latest sunxi-devel tree:
https://github.com/linux-sunxi/linux-sunxi/commits/sunxi-devel

Which is also rebased to 3.14-rc1 for those interested, I'll resend
the usb-clk patches with this + Emilio's reverted remark fixed soon-ish
then.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
