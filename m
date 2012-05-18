From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 0/9] support dt for mmp2
Date: Fri, 18 May 2012 10:15:28 +0800
Message-ID: <CAN1soZwSs1LN8AVcrF4-EKbyxNngjrXwkKCEoJ5AqWPKRG+CXQ@mail.gmail.com>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <4FB5907C.9080105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4FB5907C.9080105@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: eric.y.miao@gmail.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 18, 2012 at 7:57 AM, Rob Herring <robherring2@gmail.com> wrote:
> On 05/04/2012 07:30 AM, Haojian Zhuang wrote:
>> v2:
>> 1. remove MACH_MMP_LEGACY & MACH_MMP2_LEGACY
>> 2. use irq.c to replace irq-pxa168.c & irq-mmp2.c
>> 3. Avoid to use CONFIG_OF in entry-macro.S
>>
>
> I think you should combine all the DT board files in this series into 1
> DT board file. The only diff I can see between the files is auxdata and
> board strings. You don't have any platform_data for the auxdata, so I'm
> guessing you are using it for clkdev lookup. You can instead simply add
> addition clkdev lookup names for the DT device names. Any other reason
> for needing the old device name is pretty much wrong.
>
> Rob
>
I only tested limited devices. So platform data is not used really. While more
devices are added, platform data has to be used. So I reserve it first.

I need to add clkdev also into DT board files. It's in my TODO list.

Regards
Haojian
