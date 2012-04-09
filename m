From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 22/23] tegra: fdt: Add EMC data for Tegra2
	Seaboard
Date: Mon, 9 Apr 2012 14:53:46 -0700
Message-ID: <CAPnjgZ1kVk=s5-y0f2UMihhE0wSab5Xzw8wyuFAqTR0rbyqqOw@mail.gmail.com>
References: <1333662916-17958-6-git-send-email-sjg@chromium.org>
	<1333662916-17958-23-git-send-email-sjg@chromium.org>
	<4F8354DA.7050408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8354DA.7050408@wwwdotorg.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Apr 9, 2012 at 2:30 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 04/05/2012 03:55 PM, Simon Glass wrote:
>> This adds timings for T20 and T25 Seaboards, using the bindings found here:
>>
>> http://patchwork.ozlabs.org/patch/132928/
>>
>> We supply both full speed options for normal running, and half speed options
>> for testing / development.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>

This is the patch where I removed the T20 data. If it is not present,
then things will still work, although if you define DEBUG then you
will get warnings. We can either leave it out or put it back in for
v5, up to you.

Regards,
Simon
