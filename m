From: Hongbo Zhang <hongbo.zhang@freescale.com>
Subject: Re: [PATCH V2 1/2] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
Date: Wed, 17 Jul 2013 15:09:08 +0800
Message-ID: <51E64314.2080401@freescale.com>
References: <1373005626-20726-1-git-send-email-hongbo.zhang@freescale.com>
 <1373005626-20726-2-git-send-email-hongbo.zhang@freescale.com>
 <2E51FB91-1C34-4911-AF77-F68D292F8DDC@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <2E51FB91-1C34-4911-AF77-F68D292F8DDC@kernel.crashing.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, vakul@freescale.com, djbw@fb.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 07/15/2013 09:31 PM, Kumar Gala wrote:
> On Jul 5, 2013, at 1:27 AM, <hongbo.zhang@freescale.com> <hongbo.zhang@freescale.com> wrote:
>
>> From: Hongbo Zhang <hongbo.zhang@freescale.com>
>>
>> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch add
>> the device tree nodes for them.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
>> ---
>> arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi   |   90 +++++++++++++++++++++++++++
>> arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi   |   90 +++++++++++++++++++++++++++
>> arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |    4 +-
>> 3 files changed, 182 insertions(+), 2 deletions(-)
>> create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
>> create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
> Why didn't you update b4si-post.dtsi as well?
OK, will update it too, thanks.
>
> - k
