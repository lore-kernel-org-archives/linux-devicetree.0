From: Graeme Gregory <graeme@xora.org.uk>
Subject: Re: [PATCH v15 0/6] arm64, numa: Add numa support for arm64 platforms
Date: Tue, 5 Apr 2016 14:08:56 +0100
Message-ID: <5703B8E8.3080408__21519.9603386738$1459862176$gmane$org@xora.org.uk>
References: <1457481587-8976-1-git-send-email-ddaney.cavm@gmail.com>
 <56F1936E.1090407@redhat.com> <56F1BD15.4000701@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56F1BD15.4000701@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 22/03/16 21:45, David Daney wrote:
> On 03/22/2016 11:48 AM, Jon Masters wrote:
>> On 03/08/2016 06:59 PM, David Daney wrote:
>>
>>> From: David Daney <david.daney@cavium.com>
>>>
>>> v15:
>>>
>>>     - Make the distance-map node optional (again), if it is not in
>>>            the device tree, default values are used.
>>>
>>>     - Minor cleanups to of_numa.c as suggested by Rob Harring.
>>
>> Hi David, all,
>>
>> Wondering what the status of this patch series is currently?
>
> I haven't seen any feedback on v15.  My assumption was that the relevant
> arm64 maintainers would take some sort of action after the merge window
> quiets down.
>
> In any event, I am happy to make any improvements that may be suggested.
>
Post merge window series does not apply to 4.6-rc2 or next.

Patch 4 collides in arch/arm64/mm/mmu.c

Thanks

Graeme
