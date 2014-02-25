From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND v10 1/4] PHY: Add function set_speed to generic
 PHY framework
Date: Tue, 25 Feb 2014 19:20:46 +0530
Message-ID: <530C9FB6.9070600@ti.com>
References: <1393308882-3964-1-git-send-email-lho@apm.com>
 <1393308882-3964-2-git-send-email-lho@apm.com> <530C8711.4000600@ti.com>
 <20140225134517.GA26189@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140225134517.GA26189@htj.dyndns.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tejun Heo <tj@kernel.org>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, patches@apm.com, linux-kernel@vger.kernel.org, ddutile@redhat.com, Loc Ho <lho@apm.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 25 February 2014 07:15 PM, Tejun Heo wrote:
> On Tue, Feb 25, 2014 at 05:35:37PM +0530, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Tuesday 25 February 2014 11:44 AM, Loc Ho wrote:
>>> This patch adds function set_speed to the generic PHY framework operation
>>> structure. This function can be called to instruct the PHY underlying layer
>>> at specified lane to configure for specified speed in hertz.
>>>
>>> Signed-off-by: Loc Ho <lho@apm.com>
>>> ---
>>>  drivers/phy/phy-core.c  |   21 +++++++++++++++++++++
>>>  include/linux/phy/phy.h |    8 ++++++++
>>>  2 files changed, 29 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>> index 645c867..44f2f63 100644
>>> --- a/drivers/phy/phy-core.c
>>> +++ b/drivers/phy/phy-core.c
>>> @@ -257,6 +257,27 @@ int phy_power_off(struct phy *phy)
>>>  }
>>>  EXPORT_SYMBOL_GPL(phy_power_off);
>>>  
>>
>> missing function comment :-s
> 
> Can you please let me know when this series goes in?  I'll pull in the
> phy tree into libata and then apply the ata patches on top.

I'll send the final pull request for 3.15 merge window by next weekend to Greg
kh. Before that I'd like to have my comments addressed in this patch series.

Thanks
Kishon
