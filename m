From: Neil Armstrong <superna9999-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pyfdt : Python Flattened Device Tree Parser
Date: Mon, 22 Sep 2014 16:46:19 +0200
Message-ID: <5420363B.3070803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

I wanted to notice you about a new project I started recently : pyftd

You can find the Apache 2 licenced code at : https://github.com/superna9999/pyfdt

I needed to parse Fdt blob from python and I created the corresponding library.
The library is python 2.6 and 2.7 compatible and is tested against dtc tests blobs.

It supports dtb loading into in-memory objects and DTS or DTB output.

I plan to add "path" lookups and properties changing.
I do not have any time to implement a 'compiler' but it would be possible.

Regards,
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
