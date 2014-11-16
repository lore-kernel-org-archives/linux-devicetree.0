From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/6] sunxi: video: Add simplefb support
Date: Sun, 16 Nov 2014 18:52:51 +0100
Message-ID: <5468E473.7050304@redhat.com>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>	
	<1415984088-6800-6-git-send-email-hdegoede@redhat.com>	
	<1416138607.25454.13.camel@hellion.org.uk>
	<5468AC2E.80601@redhat.com>	
	<1416148688.25454.22.camel@hellion.org.uk>
	<5468BE9A.8050501@redhat.com>	
	<1416154297.25454.24.camel@hellion.org.uk>
	<1416158375.25454.26.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1416158375.25454.26.camel@hellion.org.uk>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Ian Campbell <ijc@hellion.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, u-boot@lists.denx.de
List-Id: devicetree@vger.kernel.org

Hi,

On 11/16/2014 06:19 PM, Ian Campbell wrote:
> On Sun, 2014-11-16 at 16:11 +0000, Ian Campbell wrote:
>>
>>> AFAIK Grant agrees with v5
>>
>> AFAIK Grant hasn't actually said that. If he does ack it (or if
>> someone
>> points me to the correct mail) then I have no further objections.
> 
> I finally found
> <CACxGe6ssdeOnQnem1012h_jFK1wWOD_WwosjFgiAcgBoqyDt9A@mail.gmail.com>
> which for some reason isn't in my devicetree@ folder nor in any of the
> archives online I looked at earlier (I could only find it by message-id
> now I know it), but it was in my sunxi folder.
> 
> So with Grant and Rob having accepted them you can consider my concerns
> with the bindings alleviated.

Thanks! I was about to reply to your earlier mail with lets wait for
Grant to get online, and see what he has to say, but this works too.

And thanks for explaining the address and size cells thing better, I
did know that for address and size #cells determines u32 vs u64, I'm
used to gpio-s / clock-s where extra cells are an extra parameter,
hence my confusion.

I'll do a v3 of the simplefb patch which takes the address and size
#cells into account.

Regards,

Hans
