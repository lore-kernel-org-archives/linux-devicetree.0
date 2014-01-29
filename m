From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND Flash
 Controller support
Date: Wed, 29 Jan 2014 11:20:42 +0100
Message-ID: <52E8D5FA.9070400@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>	<52D1494E.9090303@overkiz.com> <CAL_JsqJNd_gtn-cCLbZxT=s5NkkXp0DZkJkZrBhWiaL6Js=woQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDGNFFFRWEIBBJNMUOLQKGQEPP7WR2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAL_JsqJNd_gtn-cCLbZxT=s5NkkXp0DZkJkZrBhWiaL6Js=woQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 23/01/2014 16:22, Rob Herring wrote:
> On Sat, Jan 11, 2014 at 7:38 AM, boris brezillon
> <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 08/01/2014 15:21, Boris BREZILLON wrote:
>>> Hello,
>>>
>>> This series add the sunxi NFC support with up to 8 NAND chip connected.
>>> I'm still in the early stages drivers development and some key features
>>> are
>>> missing, but it's usable (I tested it on the cubietruck board).
>>>
>>> Here's what's missing:
>>>    - HW ECC support
>>>    - DMA support
>>>    - HW randomization support
>>>    - many more improvements
>>>
>>> This series depends on Emilio's patch series implementing mod0 clks
>>>
>>> (http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/185478.html)
>>> + an other patch not yet posted
>>>
>>> (http://git.elopez.com.ar/linux/commits/5b4eb3ac406b9c98965714d40e8dd6da943d1ab0)
>>
>> During my reasearch regarding the HW ECC and HW randomizer of the Allwinner
>> NAND flash controller I found this document describing the Altera NAND flash
>> controller
>> (which is in turn based on a cadence IP):
> Which may be similar to drivers/mtd/nand/denali.c as Cadence bought Denali?
Actually I was wrong, the sunxi and the cadence IP have nothing in common.
This was pointed out by Henrik (see this thread :
https://groups.google.com/forum/#!searchin/linux-sunxi/nand/linux-sunxi/x69tFBi95Zk/bNyJlWWOV8oJ 
<https://groups.google.com/forum/#%21searchin/linux-sunxi/nand/linux-sunxi/x69tFBi95Zk/bNyJlWWOV8oJ>).


Sorry for the false hopes.

Best Regards,

Boris

>
> Rob
