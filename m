Return-Path: <SRS0=bQdk=KV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from cpanel4.indieserve.net ([199.212.143.9]:45076 "EHLO
        cpanel4.indieserve.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbeHFOm7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Aug 2018 10:42:59 -0400
Received: from cpeac202e043973-cmac202e043970.cpe.net.cable.rogers.com ([174.112.22.87]:47912 helo=localhost.localdomain)
        by cpanel4.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.91)
        (envelope-from <rpjday@crashcourse.ca>)
        id 1fmei1-00ARNr-L4
        for devicetree@vger.kernel.org; Mon, 06 Aug 2018 08:34:02 -0400
Date: Mon, 6 Aug 2018 08:32:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: is there any continuing value in node "chosen@0"?
Message-ID: <alpine.LFD.2.21.1808060829250.18773@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Device Tree Mailing List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


  while the current DTSpec says nothing about the chosen node possibly
having a unit-address, if i search the current linux kernel code base,
there are a few examples of just that:

$ git grep chosen@
arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");
arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");
arch/powerpc/boot/oflib.c:              chosen = of_finddevice("/chosen@0");
drivers/of/base.c:              of_chosen = of_find_node_by_path("/chosen@0");
drivers/of/fdt.c:               offset = fdt_path_offset(fdt, "/chosen@0");
drivers/of/fdt.c:           (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))

  is there some lingering value to the node name "chosen@0"? or should
this all be simplified to just "chosen"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                  http://crashcourse.ca/dokuwiki

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
