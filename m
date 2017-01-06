From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v6 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161601 erratum
Date: Fri, 6 Jan 2017 12:27:39 +0000
Message-ID: <20170106122739.GA20796@arm.com>
References: <1483594317-10732-1-git-send-email-dingtianhong@huawei.com>
 <e518ab78-4093-0bc9-fe68-e7da25fd5644@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <e518ab78-4093-0bc9-fe68-e7da25fd5644@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ding Tianhong <dingtianhong@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, stuart.yoder@nxp.com, linuxarm@huawei.com, oss@buserror.net, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 11:41:28AM +0800, Ding Tianhong wrote:
> Please help reviewing the new version, I think it is nearly close to the
> final solution and it is very important to our chip or something else chip
> has similar erratum.  If there is any dissatisfaction, please inform me
> and I will fix it. :)

It looks fine to me, but I don't maintain the arch timer driver!

Will
