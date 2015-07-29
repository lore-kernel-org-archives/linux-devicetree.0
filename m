From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Use of devicetree overlay properties
Date: Wed, 29 Jul 2015 12:14:19 +0200
Message-ID: <CAOMqctR0XsTKdkusaBTxniGZHYaHCgECqL=Kw82KJGqevwz3jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

it seems that const pointers to devicetree property content are often
used throughout kernel code.

Saving pointers into static devicetree should be fine but saving
pointers into an overlay that can be destroyed is somewhat
problematic.

Typically the property would be used by a driver that would unbind
when the overlay is destroyed. Is this guaranteed in any way, though?

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
