From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] [media] atmel-isc: add driver for Atmel ISC
Date: Thu, 14 Apr 2016 17:17:37 +0300
Message-ID: <3857132.BKDS7IHZFq@avalon>
References: <1460533460-32336-1-git-send-email-songjun.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460533460-32336-1-git-send-email-songjun.wu@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Songjun Wu <songjun.wu@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Benoit Parrot <bparrot@ti.com>, Rob Herring <robh+dt@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>, Kumar Gala <galak@codeaurora.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Richard =?ISO-8859-1?Q?R=F6jfors?= <richard@puffinpack.se>, g.liakhovetski@gmx.de, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Songjun,

On Wednesday 13 Apr 2016 15:44:18 Songjun Wu wrote:
> The Image Sensor Controller driver includes two parts.
> 1) Driver code to implement the ISC function.
> 2) Device tree binding documentation, it describes how
>    to add the ISC in device tree.
> 
> 
> Songjun Wu (2):
>   [media] atmel-isc: add the Image Sensor Controller code
>   [media] atmel-isc: DT binding for Image Sensor Controller driver

I can't see the second patch in the linux-media mailing list archives, could 
you please resend it ?

>  .../devicetree/bindings/media/atmel-isc.txt        |   84 ++
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    2 +
>  drivers/media/platform/atmel/Kconfig               |    9 +
>  drivers/media/platform/atmel/Makefile              |    3 +
>  drivers/media/platform/atmel/atmel-isc-regs.h      |  280 ++++
>  drivers/media/platform/atmel/atmel-isc.c           | 1537 ++++++++++++++++
>  7 files changed, 1916 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
>  create mode 100644 drivers/media/platform/atmel/Kconfig
>  create mode 100644 drivers/media/platform/atmel/Makefile
>  create mode 100644 drivers/media/platform/atmel/atmel-isc-regs.h
>  create mode 100644 drivers/media/platform/atmel/atmel-isc.c

-- 
Regards,

Laurent Pinchart
