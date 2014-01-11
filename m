From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Sat, 11 Jan 2014 03:19:54 +0300
Message-ID: <52D08E2A.4080703@cogentembedded.com>
References: <1389393980-21183-1-git-send-email-hdegoede@redhat.com>	<52D0875B.9040102@cogentembedded.com> <52D0799B.3030401@redhat.com> <878uun1llt.fsf@nemi.mork.no>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC6MFNV32EFRBF4AYKLAKGQECA63THA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <878uun1llt.fsf-lbf33ChDnrE/G1V5fR+Y7Q@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: =?UTF-8?B?QmrDuHJuIE1vcms=?= <bjorn-yOkvZcmFvRU@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01/11/2014 02:08 AM, Bj=F8rn Mork wrote:

>>>> Here is v4 of my ohci and ehci-platform clks, phy and dt support patch=
-set,
>>>> this version should be 100% ready for merging upstream.

>>>      I see you've decided to completely ignore my opinion. NAK, FWIW.

>> I'm sorry but the whole prefix thing has become a thing of -ETOOMUCHBIKE=
SHEDDING,
>> everyone except you seems to be fine with mmio and and one point in time=
 we
>> need to make a decision and move forward.

> FWIW I agree with your decision - not that I think that matters to
> anyone :-)

    It matters at least to me, potential user of this stuff. It's a pity th=
at=20
I haven't done this myself (in fact, I had other idea than this: writing a=
=20
specific driver for my platform). As they say "if you want it done right, d=
o=20
it yourself".

> But it would have been nice if you summarized the discussion in the
> cover letter, including the reason behind your decision.  Just so that

    The reason seems quite clear: Hans wants it to be merged really fast.

> Sergei and other reviewers would see that you didn't actually ignore any
> opinion.  You just didn't agree, and you had your reasons to do so.

    Hans hasn't replied to my last mail, so I felt ignored, yes.

> Bj=F8rn

WBR, Sergei

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
