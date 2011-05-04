From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: add DT support to the S3C SDI driver
Date: Wed, 4 May 2011 04:07:46 +0200
Message-ID: <BANLkTim9UT8epyp7ccFdKq6-uobU2h0wdA@mail.gmail.com>
References: <20110413172547.GA27819@dandreoli.com>
	<201104141151.50497.anarsoul@gmail.com>
	<20110504010448.GA4952@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110504010448.GA4952-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 4, 2011 at 3:04 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
> On Thu, Apr 14, 2011 at 11:51:50AM +0300, Vasily Khoruzhick wrote:
>> On Wednesday 13 April 2011 20:25:47 Domenico Andreoli wrote:
>> > From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >
>> > This patch adds DeviceTree support to the S3C SDI driver.
>> >
>> > It implements all the configurations of the platform driver except the
>> > set_power() callback and the ocr_avail mask.
>> >
>> > Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Hm, but is there any bootloader with dt support for s3c24xx?
>
> On current u-boot mainline, all arm platforms can now add devicetree
> support by enabling CONFIG_OF_LIBFDT.

once u-boot is properly configured, is dtb built in it or is loaded from nv=
ram?

thanks,
domenico

-----[ Domenico Andreoli, aka cavok
=A0--[ http://cavokz.wordpress.com/gpgkey/
=A0=A0 ---[ 3A0F 2F80 F79C 678A 8936=A0 4FEE 0677 9033 A20E BC50
