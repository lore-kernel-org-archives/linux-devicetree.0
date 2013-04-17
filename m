From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH v2] of/base: release the node correctly in of_parse_phandle_with_args()
Date: Wed, 17 Apr 2013 06:27:07 -0500
Message-ID: <516E870B.5010303@tabi.org>
References: <1365564999-24427-1-git-send-email-Yuantian.Tang@freescale.com> <CAOZdJXW8qKccGKic3R4o1aqJdbfHcBoAp62B4HPFnF=sUAEvuQ@mail.gmail.com> <D07C73A334FF604B95B3CBD2A545D07B0B1456B8@039-SN2MPN1-013.039d.mgd.msft.net> <516E1763.7040206@tabi.org> <D07C73A334FF604B95B3CBD2A545D07B0B1457D2@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B0B1457D2@039-SN2MPN1-013.039d.mgd.msft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Tang Yuantian-B29983 <B29983@freescale.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Tang Yuantian-B29983 wrote:
> It was placed on ELSE statement originally, I moved it to IF statement.
> Why is it so wrong?

Because the logic of the comment applies to the else-condition, not the 
if-condtion.

-- 
Timur Tabi
