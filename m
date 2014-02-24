From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Movement of testcases.dtsi
Date: Mon, 24 Feb 2014 10:25:42 +0000
Message-ID: <1393237542.16570.26.camel@kazak.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

My device-tree-rebasing.git repo no longer builds, it fails with:
src/arm/versatile-pb.dts:50:26: fatal error: testcases.dtsi: No such file or directory

I suspect this is due to b5190516b282 "of: Move testcase FDT data into
drivers/of". I think I need to add drivers/of/testcase-data to the list
of paths to convert, probably extracting it to /testcase-data in the dt
repo and teach the build system about the new path in the obvious way.

Does that make sense?

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
