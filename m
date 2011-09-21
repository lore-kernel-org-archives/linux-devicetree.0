From: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: gic: add OF based initialization
Date: Wed, 21 Sep 2011 22:27:15 +0200
Message-ID: <4E7A48A3.5090602@ti.com>
References: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
	<1316550244-3655-4-git-send-email-robherring2@gmail.com>
	<4E7A1BCA.1090006@ti.com> <4E7A252F.2000402@gmail.com>
	<4E7A3AF0.1020809@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E7A3AF0.1020809-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9/21/2011 9:28 PM, Cousson, Benoit wrote:
> On 9/21/2011 7:55 PM, Rob Herring wrote:
>
> [...]
>
>> I fixed that in the prior series and tglx picked it up, so I did not
>> repost. It should hit mainline for 3.1, but I haven't verified if it is
>> in yet. Sorry for the confusion, I should have mentioned that.
>
> OK, I remember now as well that Thomas took patched 2 patches from your
> previous one. And I found it:
> https://lkml.org/lkml/2011/9/14/190
>
> Now, I have to find why the twl interrupt-controller is not working
> anymore even with that fix.

This is much better with the proper #interrupt-cells size:-)

> Almost-Tested-by: Benoit Cousson<b-cousson-l0cyMroinI0@public.gmane.org>

Tested-by: Benoit Cousson<b-cousson-l0cyMroinI0@public.gmane.org>

With a still very limited number of OMAP4 peripherals for the moment.

Regards,
Benoit
