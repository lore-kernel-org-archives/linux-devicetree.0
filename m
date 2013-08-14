Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qe0-f43.google.com ([209.85.128.43]:38025 "EHLO
	mail-qe0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758263Ab3HNPNt (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 11:13:49 -0400
Received: by mail-qe0-f43.google.com with SMTP id k5so5119278qej.16
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 08:13:48 -0700 (PDT)
Received: from bill-the-cat (cpe-065-184-250-089.ec.res.rr.com. [65.184.250.89])
        by mx.google.com with ESMTPSA id c6sm2134934qar.6.2013.08.14.08.13.47
        for <devicetree@vger.kernel.org>
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Wed, 14 Aug 2013 08:13:47 -0700 (PDT)
Date: Wed, 14 Aug 2013 11:13:45 -0400
From: Tom Rini <tom.rini@gmail.com>
Subject: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130814151345.GA2983@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hey all,

Do we have a document yet talking about the best practices for how we
would like a hardware vendor to ship, store and possibly update a device
tree, on the hardware?  "However they like" seems likely to invite
problems down the line with everyone trying their own thing.  Thanks!

-- 
Tom
