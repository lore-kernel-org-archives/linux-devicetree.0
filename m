From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/6] mfd: max8925: add irqdomain for dt
Date: Tue, 5 Feb 2013 09:19:24 +0100
Message-ID: <20130205081924.GM8476@sortiz-mobl>
References: <1359992448-22229-1-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1359992448-22229-1-git-send-email-haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, cxie4-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Haojian,

On Mon, Feb 04, 2013 at 11:40:42PM +0800, Haojian Zhuang wrote:
> From: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> Add irqdomains for max8925's main irq, wrap irq register operations
> into irqdomain's map func. it is necessary for dt support.
> 
> Also, add dt support for max8925 driver.
> 
> Signed-off-by: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mfd/max8925-core.c  |   73 +++++++++++++++++++++++++------------------
>  drivers/mfd/max8925-i2c.c   |   36 +++++++++++++++++++--
>  include/linux/mfd/max8925.h |    3 +-
>  3 files changed, 78 insertions(+), 34 deletions(-)
This and the next 5 patches applied, thanks for the heads up.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
