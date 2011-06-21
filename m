From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 16:13:35 -0700
Message-ID: <8ya7h8edbhc.fsf@huya.qualcomm.com>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
	<8yaliwueqr4.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8yaliwueqr4.fsf@huya.qualcomm.com> (David Brown's message of
	"Tue, 21 Jun 2011 15:58:23 -0700")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Tony Lindgren <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21 2011, David Brown wrote:

> On Mon, Jun 20 2011, Nicolas Pitre wrote:
>
>> +void *memmove(void *__dest, __const void *__src, size_t __n)
>> +{
>> +	unsigned char *d = __dest;
>> +	const unsigned char *s = __src;
>> +
>> +	if (__dest == __src)
>> +		return __dest;
>> +
>> +	if (__dest < __src)
>> +		return memcpy(__dest, __src, __n);
>> +
>> +	while (--__n >= 0)
>> +		d[__n] = s[__n];
>> +
>> +	return __dest;
>> +}
>
> Ahh, found it.  size_t is unsigned, so the while loop never terminates.
> Something like:
>
> 	for (; __n; __n--)
> 		d[__n] = s[__n];

Ugh.  How about if I don't replace a broken version with a different
broken version.

	while (__n) {
		__n--;
                d[__n] = s[__n];
	}

Now, I don't need any extra fields in my DTB, and it correctly inserts
the ATAG values.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
