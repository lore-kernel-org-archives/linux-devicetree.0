From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 00/12] media: staging/imx7: add i.MX7 media driver
Date: Wed, 21 Nov 2018 12:53:34 +0100
Message-ID: <18c5ad5c-e800-c317-4246-a8a207f3dff4@xs4all.nl>
References: <20181121111558.10838-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181121111558.10838-1-rui.silva@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/21/2018 12:15 PM, Rui Miguel Silva wrote:
> Hi,
> This series introduces the Media driver to work with the i.MX7 SoC. it uses the
> already existing imx media core drivers but since the i.MX7, contrary to
> i.MX5/6, do not have an IPU and because of that some changes in the imx media
> core are made along this series to make it support that case.

Can you run scripts/checkpatch.pl --strict over these patches? I get too
many messages from it. Most should be easy to fix.

Regards,

	Hans
