From: Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: (unknown)
Date: Sun,  8 Oct 2017 18:28:26 +0200
Message-ID: <1507480107-3576-1-git-send-email-larturus2@gmail.com>
References: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Subject: 
In-Reply-To: <1504117946-3958-1-git-send-email-larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

Thanks for checking the patch.

I missed the #else part of he CONFIG_OF #ifdef previously.

I made the code properly depend on CONFIG_OF now.

I am not familiar with this code base. When time allows I would like to contribute by  refactoring code in this area.

Let me know if you have specific ideas about what should change and how the code should be refactored.

Artur
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
