From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Fri, 25 Sep 2015 11:01:29 -0500
Message-ID: <56056FD9.5060000@ti.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com>
 <1442938118-4718-2-git-send-email-nm@ti.com> <5602ED34.9010108@oracle.com>
 <56040323.1080409@ti.com> <560406C2.6090200@ti.com> <56041CA4.40208@ti.com>
 <56055F1F.4060401@ti.com> <560565AF.2010701@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <560565AF.2010701@oracle.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: santosh shilimkar <santosh.shilimkar@oracle.com>, Nishanth Menon <nm@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/25/2015 10:18 AM, santosh shilimkar wrote:
> On 9/25/2015 7:50 AM, Nishanth Menon wrote:
[...]
>> But, how about userspace
>> needing to know which SoC they are on, without needing to depend on
>> board->soc mapping? How do we help resolve that?
>>
> Why the user space should care about exact SOC ?

examples vary - trivial one is: debug tools like omapconf[1] or testing
tools like opentest[2] need some standard way to ensure Linux kernel is
functional - trusting the least set of parameters is usually what we
would prefer. while building a generic distro such as debian or yocto,
one prefers NOT to need to do a package build per SoC/perboard - that
never scales. instead, you'd like the same application run on different
systems dynamically.


[1] https://github.com/omapconf/omapconf
[2] http://arago-project.org/wiki/index.php/Opentest
-- 
Regards,
Nishanth Menon
