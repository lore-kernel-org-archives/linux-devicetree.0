From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 18/18] tegra: fdt: Enable FDT support for
	Seaboard
Date: Fri, 3 Feb 2012 09:05:23 -0800
Message-ID: <CAPnjgZ2Y5rA9siGiRVRQwVmm8gnbN_z0QL7rMn-3GvmTU2GfmQ@mail.gmail.com>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
	<1327447272-30182-19-git-send-email-sjg@chromium.org>
	<4F2B0B5F.10400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F2B0B5F.10400@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Feb 2, 2012 at 2:17 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/24/2012 04:21 PM, Simon Glass wrote:
>> This switches Seaboard over to use FDT for run-time config instead of
>> CONFIG options. USB is the only user at present.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Aside from the issues I've just mentioned in my recent emails, and from
> needing to update to the clock binding we discussed on the Linux mailing
> lists, the whole series is:
>
> Acked-by: Stephen Warren <swarren@nvidia.com>

Thanks - it would be nice to get this in since it is the first actual
use of fdt in U-Boot.

I will resend the two patches that need changing as v6.

>
> --
> nvpublic

Regards,
Simon
