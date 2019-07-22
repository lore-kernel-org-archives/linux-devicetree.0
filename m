From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND 1/1] dt-bindings: serial: lpuart: add the clock
 requirement for imx8qxp
Date: Mon, 22 Jul 2019 17:55:09 -0600
Message-ID: <20190722235509.GA1256@bogus>
References: <20190704134355.2402-1-fugang.duan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190704134355.2402-1-fugang.duan@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.baluta@gmail.com, fugang.duan@nxp.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu,  4 Jul 2019 21:43:55 +0800, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> Add the baud clock requirement for imx8qxp.
> 
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
