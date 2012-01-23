From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 1/2] fdt: Add fdtdec_find_aliases() to deal
 with alias nodes
Date: Sun, 22 Jan 2012 20:08:10 -0800
Message-ID: <CAPnjgZ2VsLsti2PTGucJ0Te1HYJLnV7eory1VX8jYRuVtAK21g@mail.gmail.com>
References: <1326824452-14786-1-git-send-email-sjg@chromium.org>
	<1326824452-14786-2-git-send-email-sjg@chromium.org>
	<4F1CC017.1090501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F1CC017.1090501@gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Jerry Van Baren <gvb.uboot@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Jerry,

On Sun, Jan 22, 2012 at 6:04 PM, Jerry Van Baren <gvb.uboot@gmail.com> wrote:
> On 01/17/2012 01:20 PM, Simon Glass wrote:
>> Stephen Warren pointed out that we should use nodes whether or not they
>> have an alias in the /aliases section. The aliases section specifies the
>> order so far as it can, but is not essential. Operating without alisses
>
> Nitpick: aliases

Thanks for the review - will resend this patch to tidy that up.

>
>> is useful when the enumerated order of nodes does not matter (admittedly
>> rare in U-Boot).
>>
>> This is considerably more complex, and it is important to keep this
>> complexity out of driver code. This patch creates a function
>> fdtdec_find_aliases() which returns an ordered list of node offsets
>> for a particular compatible ID, taking account of alias nodes.
>>
>> Signed-off-by: Simon Glass<sjg@chromium.org>
>
> Acked-by: Gerald Van Baren <vanbaren@cideas.com>
>
> Thanks,
> gvb

Regards,
Simon
