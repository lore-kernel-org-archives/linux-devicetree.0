From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: vexpress: initial device tree support
Date: Thu, 12 Jan 2012 08:49:54 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17801D1C9A@HQMAIL01.nvidia.com>
References: <CAOZdJXXPJEaFO-ymvb_TsTJ6W2T7_aWXA=9RZprVmKBOn9cu8A@mail.gmail.com>
 <4F0B897A.20502@firmworks.com>
 <20120110122252.GA7180@jl-vm1.vm.bytemark.co.uk>
 <4F0CB485.9010106@freescale.com> <4F0CBD46.2010909@firmworks.com>
 <4F0CD7BC.7080409@freescale.com> <4F0D2F90.8020801@firmworks.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A770@HQMAIL01.nvidia.com>
 <4F0DF1E6.40602@freescale.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A777@HQMAIL01.nvidia.com>
 <20120112122406.GG7180@jl-vm1.vm.bytemark.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120112122406.GG7180-DqlFc3psUjeg7Qil/0GVWOc42C6kRsbE@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: =?iso-8859-2?Q?Pawe=B3_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jamie Lokier wrote at Thursday, January 12, 2012 5:24 AM:
...
> For all the above reasons I think the DDC/EDID support in the kernel
> should be moving gently towards a (very small) DDC/EDID mini-subsystem
> shared by video drivers.  I.e. it should be exposed as a well-known
> I2C bus name, and if it's GPIO bit-banging I2C, that should be exposed
> as well.

I don't think a single well-known bus name would work, since it's very
common for a system to have multiple DDC busses, since they have multiple
video connectors.

However, representing each physical connector as a jack object to user-
space (perhaps related to media controller, or a cross-subsystem extension
of the ALSA jack objects?) and associating the I2C bus ID (or some more
abstract display-oriented ID) with it would make sense.

-- 
nvpublic
