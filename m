From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] configfs: Remove ppos increment in configfs_write_bin_file
Date: Thu, 30 Jun 2016 16:35:54 +0200
Message-ID: <57752E4A.9000203@denx.de>
References: <1463581011-9910-1-git-send-email-marex@denx.de> <5772A624.6040801@denx.de> <20160630092616.GA9099@lst.de> <577515C6.5050802@denx.de> <20160630141948.GA19378@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160630141948.GA19378-jcswGhMUV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/30/2016 04:19 PM, Christoph Hellwig wrote:
> On Thu, Jun 30, 2016 at 02:51:18PM +0200, Marek Vasut wrote:
>>> sorry for the delay.  I've applied the fix and will send it out to
>>> Linus for the 4.7 merge window.
>>
>> No problem, glad to see it applied, thanks!
>>
>> btw. is this (devicetree@) the correct list for such a patch or should
>> this be sent to some other list (linux-fsdevel@ maybe) ?
> 
> I don't think devicetree is anywhere near right.  fsdevel and lkml
> are the right place.
> 
Got it, I'll keep that in mind. Thanks

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
