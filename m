From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: [PATCH 1/4] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Wed, 26 Aug 2015 10:59:22 -0500
Message-ID: <55DDE25A.2050000@mentor.com>
References: <1440594483-29601-1-git-send-email-lee.jones@linaro.org>
 <1440594483-29601-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440594483-29601-2-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: ohad@wizery.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On 08/26/2015 08:08 AM, Lee Jones wrote:
> diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> new file mode 100644
> index 0000000..6a933c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> @@ -0,0 +1,38 @@
> +STMicroelectronics Remote Processor
> +-----------------------------------
> +
> +This binding provides support for adjunct processors found on ST SoCs.
> +
> +The remote processors can be controlled from the bootloader or the primary OS.
> +If the bootloader starts a remote processor processor the primary OS must detect
> +its state and act accordingly.
> +
> +The node name is significant, as it defines the name of the CPU and the name
> +of the firmware to load: "rproc-<name>-fw".

This business about the firmware name describes a behavior of Linux's
core remoteproc code and seems out of place in a binding document.
