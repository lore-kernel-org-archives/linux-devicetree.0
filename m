From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: add DT support to the S3C SDI driver
Date: Tue, 3 May 2011 20:18:36 -0600
Message-ID: <BANLkTinw2abP=zT__dmBQdQ9hUfhh5R9Ww@mail.gmail.com>
References: <20110413172547.GA27819@dandreoli.com>
	<201104141151.50497.anarsoul@gmail.com>
	<20110504010448.GA4952@ponder.secretlab.ca>
	<BANLkTim9UT8epyp7ccFdKq6-uobU2h0wdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTim9UT8epyp7ccFdKq6-uobU2h0wdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 3, 2011 at 8:07 PM, Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, May 4, 2011 at 3:04 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Thu, Apr 14, 2011 at 11:51:50AM +0300, Vasily Khoruzhick wrote:
>>> On Wednesday 13 April 2011 20:25:47 Domenico Andreoli wrote:
>>> > From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> >
>>> > This patch adds DeviceTree support to the S3C SDI driver.
>>> >
>>> > It implements all the configurations of the platform driver except the
>>> > set_power() callback and the ocr_avail mask.
>>> >
>>> > Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Hm, but is there any bootloader with dt support for s3c24xx?
>>
>> On current u-boot mainline, all arm platforms can now add devicetree
>> support by enabling CONFIG_OF_LIBFDT.
>
> once u-boot is properly configured, is dtb built in it or is loaded from nvram?

Typically it is loaded from the same place the kernel is stored, but
it can be loaded from any device supported by u-boot.

g.
