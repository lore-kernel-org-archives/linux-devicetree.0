From: zhangfei gao <zhangfei.gao@gmail.com>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Tue, 25 Jun 2013 13:34:31 +0800
Message-ID: <CAMj5BkgKSmDWZ8=tOEvj7mhf-zfZVtO1F0eKTN6UzjYepHmMbA@mail.gmail.com>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
 <201306211341.53928.arnd@arndb.de>
 <CAMj5Bkg_4G9n9BaQjA-Xj2p8jGO8PZxNW7E7jOeWMMZa5sH6yQ@mail.gmail.com>
 <10541174.SUr9yD0veu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <10541174.SUr9yD0veu@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vinod.koul@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 12:15 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 24 June 2013 16:49:08 zhangfei gao wrote:
>>
>> Dear Arnd & Vinod
>>
>> The suggestion of using dma_get_slave_channel instead of filter works here.
>> Dma driver should modify accordingly.
>
> The changes all look good to me, thanks a lot for following up!
>
> However, you should really follow the procedure for posting patches even
> if it's just for the sake of discussion:
>
> * always provide a signed-off-by and a patch description
> * use an email client that doesn't break whitespace
> * I would have split this up into two separate patches, one for the
>   subsystem and one for the new driver.

Thanks Arnd for for kind education,
Will send two patches, one is subsystem, the other is updated host driver.

Thanks
