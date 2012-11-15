From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH V3 0/5] SMP support for Armada XP
Date: Thu, 15 Nov 2012 09:50:13 +0100
Message-ID: <50A4ACC5.4040209@free-electrons.com>
References: <1352931637-3405-1-git-send-email-gregory.clement@free-electrons.com>
 <50A4ABD1.3070902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50A4ABD1.3070902@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hui Wang <jason77.wang@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.>
List-Id: devicetree@vger.kernel.org

Hello Hui,

On 11/15/2012 09:46 AM, Hui Wang wrote:
> Sorry for asking a question. Does it support CPU HOTPLUG? I am just 
> testing the marvell 2012_Q4.1, and found the CPU HOTPLUG (echo 0|1 > 
> /sys/devices/system/cpu/cpu1/online) doesn't work on the XP_GP board, 
> does your BSP have the same problem?
> 

Indeed, we don't support it yet, but we plan to add this feature once
this "basic" support will be included in the 3.8.

> Regards,
> Hui.
> 
> Gregory CLEMENT wrote:
>> Hello,
>>
>> The purpose of this patch set is to add the SMP support for the Armada
>> XP SoCs. Beside the SMP support itself brought by the last 3 patches,
>> this patch set also adds the support for the coherency fabric unit and
>>   
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
