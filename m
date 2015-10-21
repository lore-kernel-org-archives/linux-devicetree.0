From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Does dt property name in a binding always need a vendor prefix?
Date: Wed, 21 Oct 2015 11:05:14 -0400
Message-ID: <5627A9AA.6040004@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Kwok, WingMan" <w-kwok2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Experts,

I am looking for guidelines to name a DT property in a bindings. Do we 
need to add a vendor specific prefix always or is it needed only 
specific cases? I know the intent here is to avoid name space collision. 
But by name space I assume, within a specific a device binding. For 
example where device driver has a core framework that also uses DT 
properties, any low level device driver using the framework needs to add 
a vendor specific prefix to avoid collision. Is my understanding 
correct? So standalone device drivers doesn't have to use prefix? Right?

-- 
Murali Karicheri
Linux Kernel, Keystone
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
