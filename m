From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/4] Support for device-tree appended to zImage
Date: Mon, 28 Feb 2011 19:25:22 -0800
Message-ID: <4D6C6722.3040904@secretlab.ca>
References: <20110228233153.24836.24176.stgit@riker>
	<20110301025836.GA3920@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110301025836.GA3920-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

I'm using Grant's tree with Nicolas Pitre's patch to the compressed
image wrapper. His patches went out to the ARM list and I'm told they
were accepted. These patches may not yet be in Grant's tree. These
patches are titled:

[PATCH 1/2] ARM: improvements to compressed/head.S
[PATCH 2/2] ARM: remove the 4x expansion presumption while decompressing
the kernel

Grant, is there a branch in your tree that people should be using, or
should be they applying both sets of patches?

- John

On 02/28/2011 06:58 PM, Shawn Guo wrote:
> Hi John,
> 
> On Mon, Feb 28, 2011 at 03:33:18PM -0800, John Bonesio wrote:
>> The following series support for device tree binary blobs (dtb) that are
>> appended to the compressed kernel image (zImage).
>>
>> Having appended dtb data is not required to boot with a device tree. If no dtb
>> data is appended to zImage, the kernel will boot using prior methods.
>>
>> ---
>>
>> John Bonesio (4):
>>       ARM:boot:device tree: Allow the device tree binary to be appended to zImage
>>       ARM:boot:device tree: Merge specific atags into the device tree
>>       ARM:boot:device tree: Add puthex routine for use in the boot wrapper
>>       ARM:boot:device tree: Allow multiple device trees to be appended to zImage
>>
>>
>>  arch/arm/Kconfig                  |    7 ++
>>  arch/arm/boot/compressed/Makefile |   31 +++++++-
>>  arch/arm/boot/compressed/atags.c  |   70 +++++++++++++++++++
>>  arch/arm/boot/compressed/head.S   |  136 +++++++++++++++++++++++++++++++++++--
>>  arch/arm/boot/compressed/misc.c   |  134 ++++++++++++++++++++++++++++++++++++
>>  5 files changed, 365 insertions(+), 13 deletions(-)
>>  create mode 100644 arch/arm/boot/compressed/atags.c
>>
> I'm trying to test and use it.  But it does not apply against any tree
> that I can find, neither mainline nor Grant's tree.  Need rebasing?
> 
