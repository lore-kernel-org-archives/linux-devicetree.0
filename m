From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 22/23] tegra: fdt: Add EMC data for Tegra2
	Seaboard
Date: Tue, 3 Apr 2012 17:47:41 -0700
Message-ID: <CAPnjgZ0xS2rv688y6VTNMX27OctBURn+jC2QN7HaSFqUy1jZ8g@mail.gmail.com>
References: <1333408743-28720-1-git-send-email-sjg@chromium.org>
	<1333408743-28720-23-git-send-email-sjg@chromium.org>
	<CAOesGMh1OaJ9DDj+xxfOf268J93WbOmpZSJutBLB3xQ+6W4C-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAOesGMh1OaJ9DDj+xxfOf268J93WbOmpZSJutBLB3xQ+6W4C-w@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Olof Johansson <olof@lixom.net>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Olof,

On Mon, Apr 2, 2012 at 10:22 PM, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Apr 2, 2012 at 4:19 PM, Simon Glass <sjg@chromium.org> wrote:
>> This adds timings for T20 and T25 Seaboards, using the bindings found here:
>>
>> http://patchwork.ozlabs.org/patch/132928/
>>
>> We supply both full speed options for normal running, and half speed options
>> for testing / development.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> This seems incorrect to me. You provide both T20 and T25 EMC tables in
> the same device tree with no way to determine which one to use.
>
> Unfortunately nvidia didn't use the boot straps to tell if they were
> on a t20 or t25 seaboard, so you'll just have to know. At the kernel
> side we chose to just ditch T20 since most boards still in use are
> T25.

The selection of memory speed is down to the board. There is a later
patch in this series (just cc'd to you) which looks at the SOC ID to
determine whether it is T20 or T25, and selects the speed accordingly.
This speed is used to look up the correct table in the device tree

>
>
>
> -Olof

Regards,
Simon
