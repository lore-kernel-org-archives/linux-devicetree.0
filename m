From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding
	documentation
Date: Mon, 30 Sep 2019 13:57:41 -0500
Message-ID: <20190930185741.GA18160@bogus>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 13 Sep 2019 17:42:13 +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
