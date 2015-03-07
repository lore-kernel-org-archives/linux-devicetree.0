From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new MK808C device
Date: Sat, 7 Mar 2015 09:41:54 +0100
Message-ID: <CAEKpxBnRyhD8Xiu7uTomM=z4Xm4CH8WVTYjZH73yDgYzwMqn5w@mail.gmail.com>
References: <1425131004-8551-1-git-send-email-codekipper@gmail.com>
	<20150303071342.GB4713@lukather>
	<CAEKpxB=-vtjMckh3ZHoy0mezE9U1EtKzmttdXRD5ZNztZvB_ag@mail.gmail.com>
	<20150304203400.GR4911@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBU7T5KTQKGQEYKMXCSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150304203400.GR4911@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 March 2015 at 21:34, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Mar 03, 2015 at 09:22:32PM +0100, Code Kipper wrote:
>> >> +
>> >> +/ {
>> >> +     model = "mk808c";
>> >> +     compatible = "mk808c", "allwinner,sun7i-a20";
>> >
>> > the compatible must be of the format "vendor,device". Please add the
>> > vendor name.
>>
>> Ahhh....I've searched high and low for a vendors name. I listed it as
>> unknown on the wiki page,
>> would 'odm' be considered valid?
>
> Not really. Another mk808c device might very well be made by some
> other odm.
>
Hi Maxime,

I documented the device here at http://linux-sunxi.org/MK808C.

> Don't your device has any brand on the case or the PCB?

There is nothing on the PCB to reference a manufacturer, the actual packaging
and case are from the earlier MK808B and mention A9. There was only a
small sticker on the side to show that the contents was a MK808C.
I guess 'unknown' isn't a valid vendor name,
>
> Maxime
BR,
CK
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
