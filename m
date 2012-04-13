From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 16:12:02 -0500
Message-ID: <4F8896A2.60206@freescale.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8894FD.70307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8894FD.70307@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Devicetree@theia.denx.de, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 04/13/2012 04:05 PM, Stephen Warren wrote:
> On 04/13/2012 12:29 PM, Simon Glass wrote:
>> Add a NAND controller along with a bindings file for review.
>>
>> Signed-off-by: Simon Glass<sjg@chromium.org>
>
>> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
>
> I'd prefer this be called nvidia,tegra20-nand.txt so filenames are named
> according to compatible value. This makes it easier to look things up.

Could be awkward if additional compatibles are added, though.  Grep can 
find compatibles within the text.

-Scott
