From: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Subject: Re: [uclinux-dist-devel] touch screen ads7846/7843 devicetree support
Date: Thu, 27 Jan 2011 21:31:23 +0800
Message-ID: <4D4173AB.3020809@wytron.com.tw>
References: <4D410C4C.7070005@wytron.com.tw>	<AANLkTinJheHYyjUUAK7guNXqepp9KJ3xk6u-4JrmAbee@mail.gmail.com>
	<4D414FED.706@wytron.com.tw>
	<544AC56F16B56944AEC3BD4E3D591771324C105D75@LIMKCMBX1.ad.analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <544AC56F16B56944AEC3BD4E3D591771324C105D75-gpnycfiEEVR7xzP2fcxY8GoKb0G9Rp+C@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Hennerich, Michael" <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Nios2 development list <nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>, Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "device-drivers-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org" <device-drivers-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org>, "uclinux-dist-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org" <uclinux-dist-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Michael,

On 01/27/2011 08:24 PM, Hennerich, Michael wrote:
> This driver is a SPI bus client driver. PPC is using devicetree for ages now,
> and they don't have problems instantiating this or any other SPI bus driver..

Thanks for the pointer. I looked in powerpc dir and found one usage in

linux-2.6/arch/powerpc/platforms/512x/pdm360ng.c

I will try to follow it.

Best regards,
Thomas
