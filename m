From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] Input: matrix-keypad - Add device tree support
Date: Fri, 02 Nov 2012 12:55:53 -0600
Message-ID: <50941739.1000404@wwwdotorg.org>
References: <1351854182-10978-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351854182-10978-1-git-send-email-anilkumar-l0cyMroinI0@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/02/2012 05:03 AM, AnilKumar Ch wrote:
> Add device tree support to matrix keypad driver and usage details
> are added to device tree documentation. Driver was tested on AM335x
> EVM.

> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt

> +Optional Properties:

> +- clustered-irq:	have clustered irq number, that is needed if the irq
> +			is a combined irq source for the whole matix keypad.
> +			This is useful if rows and columns of the keypad are
> +			connected to a GPIO expander.
> +- clustered-irq-flags:	clustered irq flags

Shouldn't the GPIO expander itself be an IRQ controller too? What are
the clustered-irq-flags values?
