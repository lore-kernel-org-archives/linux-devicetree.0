From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
Subject: "powerpc/83xx: gianfar_ptp: select 1588 clock source through dts
 file" was added twice
Date: Sat, 12 Oct 2013 18:54:42 +0400
Message-ID: <525962B2.8010100@skitlab.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

recently I looked through commits in kernel/git/torvalds/linux.git and I 
noticed that my patch (old and new version) was added twice (by David S. 
Miller):

e58f6f4fb4eada7867014bfaec898f03afbce5c2
894116bd0e9b7749a0c4b6c62dec13c2a0ccef68

I think this is not good, and only 
e58f6f4fb4eada7867014bfaec898f03afbce5c2 should be added.

Thanks!

-- 
Regards,
Aida
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
