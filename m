From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] ARM: imx6qdl: provide pinctrl configurations
 for DAT3 pull-down
Date: Mon, 07 Oct 2013 20:52:40 -0600
Message-ID: <52537378.1020904@wwwdotorg.org>
References: <20131005112147.GX12758@n2100.arm.linux.org.uk> <E1VSPw9-0004Ug-BF@rmk-PC.arm.linux.org.uk> <20131007055340.GB3739@S2101-09.ap.freescale.net> <20131007180357.GS12758@n2100.arm.linux.org.uk> <20131008015426.GA7480@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008015426.GA7480-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/07/2013 07:54 PM, Shawn Guo wrote:
> On Mon, Oct 07, 2013 at 07:03:57PM +0100, Russell King - ARM Linux wrote:
>> On Mon, Oct 07, 2013 at 01:53:43PM +0800, Shawn Guo wrote:
>>> I think we can redefine only pad DAT3 in pinctrl_usdhc1_1_dat3cd, and
>>> overwrite the DAT3 configuration in pinctrl_usdhc1_1 to save the
>>> redundant data of other pads, something like the following.
>>>
>>> pinctrl_usdhc1_1_dat3cd: usdhc1grp-3 {
>>> 	fsl,pins = <
>>> 		MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x13059
>>> 	>;
>>> };
>>>
>>> &usdhc1 {
>>> 	pinctrl-names = "default";
>>> 	pinctrl-0 = <&pinctrl_usdhc1_1 &pinctrl_usdhc1_1_dat3cd>;
>>> 	...
>>> 	status = "okay";
>>> };
>>
>> Are you sure that this will always be the case?  This would assume that
>> the pinctrl entries are always processed sequentially.
> 
> That will always be the case per my understanding.  Otherwise, I would
> be so surprised.  Are you seeing any case that the entries are not
> processed sequentially?

Given the way the Linux code currently works, I think that will
currently happen in practice. However, there's nothing in the pinctrl DT
binding documentation that guarantees (or even mentions) such semantics.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
