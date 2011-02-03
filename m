From: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Subject: Re: [uclinux-dist-devel] touch screen ads7846/7843 devicetree support
Date: Thu, 03 Feb 2011 08:07:53 +0800
Message-ID: <4D49F1D9.70909@wytron.com.tw>
References: <4D410C4C.7070005@wytron.com.tw>
	<AANLkTinJheHYyjUUAK7guNXqepp9KJ3xk6u-4JrmAbee@mail.gmail.com>
	<4D414FED.706@wytron.com.tw>
	<544AC56F16B56944AEC3BD4E3D591771324C105D75@LIMKCMBX1.ad.analog.com>
	<20110202160355.GE20275@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110202160355.GE20275-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nios2 development list <nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>, "Hennerich,
	Michael" <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "device-drivers-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org" <device-drivers-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org>, "uclinux-dist-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org" <uclinux-dist-devel-ZG0+EudsQA8dtHy/vicBwGD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/03/2011 12:03 AM, Grant Likely wrote:
> On Thu, Jan 27, 2011 at 12:24:01PM +0000, Hennerich, Michael wrote:
>> Thomas Chou wrote on 2011-01-27:
>>> On 01/27/2011 02:18 PM, Mike Frysinger wrote:
>>>> On Thu, Jan 27, 2011 at 01:10, Thomas Chou wrote:
>>>>> We need devicetree support on ads7846/7843 touch screen driver. Do
>>>>> you have plan on it? We are moving to devicetree on nios2, so do
>>> arm/mips/x86.
>>>>
>>>> what part are you using exactly ?
>>>> -mike
>>>>
>>>
>>> ad7843 is used in a popular nios2 dev kit, NEEK.
>>
>> This driver is a SPI bus client driver. PPC is using devicetree for ages now,
>> and they don't have problems instantiating this or any other SPI bus driver.
>
> However, the method used is by applying a heuristic (of_modalias_node)
> which tries to name the device in a way that will match an existing
> device driver.  It works for a lot of spi drivers, but it isn't
> always reliable.
>
> Alternatively, if of_match_table is populated in the spi_driver, then
> the normal device tree match behaviour will always work.

Thanks. The driver did match with the heuristic. But it needs to 
determine pen state. I will try to bind a gpio node in dts.

linux/spi/ads7846.h

int	gpio_pendown;		/* the GPIO used to decide the pendown
				 * state if get_pendown_state == NULL
				 */

- Thomas
