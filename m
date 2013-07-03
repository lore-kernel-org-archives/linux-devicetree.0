From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
Date: Wed, 3 Jul 2013 14:02:08 -0500
Message-ID: <1372878128.8183.143@snotra>
References: <1372650378-2936-1-git-send-email-hongbo.zhang@freescale.com>
 <51D3A030.4020608@freescale.com> <51D3D76B.5040306@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D3D76B.5040306-KZfg59tc24xl57MIdRCFDg@public.gmane.org> (from
 hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org on Wed Jul  3 02:48:59 2013)
Content-Disposition: inline
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
Cc: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vakul-KZfg59tc24xl57MIdRCFDg@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/03/2013 02:48:59 AM, Hongbo Zhang wrote:
> On 07/03/2013 11:53 AM, Hongbo Zhang wrote:
>> hmm...add the devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org into list.
>> 
>> Note that we are discussing a better naming for this new compatible  
>> property in the corresponding [PATCH 2/2], so I will resend a v2 of  
>> this patch.
>> 
>> 
>> On 07/01/2013 11:46 AM, hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>>> From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> 
>>> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this  
>>> patch add
>>> the device tree nodes for them.
>>> 
>>> Signed-off-by: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>>   arch/powerpc/boot/dts/fsl/qoriq-dma2-0.dtsi |   90  
>>> +++++++++++++++++++++++++++
>>>   arch/powerpc/boot/dts/fsl/qoriq-dma2-1.dtsi |   90  
>>> +++++++++++++++++++++++++++
>>>   arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |    4 +-
>>>   3 files changed, 182 insertions(+), 2 deletions(-)
>>>   create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-dma2-0.dtsi
>>>   create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-dma2-1.dtsi
> Scott, any comment of these two file names?

There's "dma2" again...

How about elo3-dma-<n>.dtsi?

-Scott
