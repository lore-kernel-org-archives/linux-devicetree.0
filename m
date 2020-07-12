Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2C3C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 04:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C937F2070B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 04:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SjZ2Xd2k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgGMELq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 00:11:46 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:36783 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGMELo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 00:11:44 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200713041142epoutp049d2a5bd6d6c5b74dd309842eef881093~hNIgP3NAu2145821458epoutp04d
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 04:11:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200713041142epoutp049d2a5bd6d6c5b74dd309842eef881093~hNIgP3NAu2145821458epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594613502;
        bh=XzXGzfpAcJxVThQIWOeUjg4uBg4tetUU3f6cEGrLIYA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=SjZ2Xd2kYG2R2HkcTVVQEaW2C4Sx4jM2en5WtuKZxqSb0+1/I/0fJjaz3HY+Gj1fD
         9J0n6dWKCytpnBqmyt3f69V/CCxD2Hoswn6znOA1vInQh7dw1C+2MMZ9VY7X9JYPFP
         9GCcsPOGKqUgrXetMQUO0n/0uN4ErPVkAck0l3DU=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20200713041141epcas5p4f75f706c798e1e9c702ed18e9502de74~hNIfgZCCg1452614526epcas5p4K;
        Mon, 13 Jul 2020 04:11:41 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.91.09703.DFEDB0F5; Mon, 13 Jul 2020 13:11:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20200712165648epcas5p3a1e6b9f9e1fdadc6740bc1eb509285f9~hD7PTMfVn2057020570epcas5p3M;
        Sun, 12 Jul 2020 16:56:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200712165648epsmtrp1bed5e6f807b47aac1e4d99abced6e461~hD7PSYgHO0771707717epsmtrp1I;
        Sun, 12 Jul 2020 16:56:48 +0000 (GMT)
X-AuditID: b6c32a4a-4cbff700000025e7-c2-5f0bdefd3e06
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        5C.40.08382.FC04B0F5; Mon, 13 Jul 2020 01:56:47 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200712165646epsmtip277c5f22624f1bf97a2c37d09d55238f8~hD7NqJswj1457514575epsmtip2w;
        Sun, 12 Jul 2020 16:56:46 +0000 (GMT)
From:   Ajay Kumar <ajaykumar.rs@samsung.com>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, will@kernel.org
Cc:     nleeder@codeaurora.org, shameerali.kolothum.thodi@huawei.com,
        joro@8bytes.org, robin.murphy@arm.com, alim.akhtar@samsung.com,
        shaik.ameer@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/4] Documentation: perf: Add documentation for
 arm-smmu-v3-pmcg
Date:   Sun, 12 Jul 2020 22:05:30 +0530
Message-Id: <20200712163530.61468-1-ajaykumar.rs@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsWy7bCmuu7fe9zxBp0LOS0OvD/IYvFg3jY2
        i/lHzrFadM7ewG6x9PpFJotvx2IsWvceYbc4+OEJq8WRh7vZLbZfbWK1aLlj6sDt8eTgPCaP
        NfPWMHpc7utl8mg58pbVY9OqTjaPvi2rGD0+b5ILYI/isklJzcksSy3St0vgyuj+upK1YA5n
        xbnvn1gbGG+zdzFyckgImEj0LP7N0sXIxSEksJtRYtrJV6wQzidGibaHy9ghnG+MEvMurmCB
        aXn28QMTRGIvo8SSA71Q/S1MEjdWXmUEqWIT0JbYNv0mWIeIQLRE34npzCBFzAJHGCUOXb4P
        VMTBISwQJPGl2RCkhkVAVWLJ/C0sIGFeAVuJSQdLIJbJS6zecACsVULgGrvEgsZLTBAJF4nv
        /cvZIGxhiVfHt0A9JCXxsr+NHaKhn1Hi6f0/UN2rGSUePLzADFFlL3HgyhywbcwCmhLrd+lD
        hGUlpp5aB7aAWYBPovf3E6hlvBI75oHYHEC2msTWFX4QYRmJMwevQJV4SJx9MgfsHiGBWIn3
        y1axT2CUnYWwYAEj4ypGydSC4tz01GLTAqO81HK94sTc4tK8dL3k/NxNjOCUoeW1g/Hhgw96
        hxiZOBgPMUpwMCuJ8EaLcsYL8aYkVlalFuXHF5XmpBYfYpTmYFES51X6cSZOSCA9sSQ1OzW1
        ILUIJsvEwSnVwFRtZaXxeGfcsqVNOsvavlS1iCx57RGW//fhp4aILU8Vixd5isbraCguS5ir
        3vzh2Hl9nho3X6bdndfb2S5/Fs1dMcna+scM24MtL29fDPrqEb2Jv9t0IxeDp+2+4sJa9/+t
        0+5vDCxLv/HjQUVe+++3G7uaMxwX6F8UczucvnT99EqFzQGB8zZUeIplptpeaeYNjhG//np2
        3A8xzvebWB/57ttxcHan4o/sGTfF5qRFNblNj6xeHL7czrcjKHvhL3vWT58ETnHY6njIv0gw
        yz0bVnuvYNrdxW2TPv6N+6TpFlO+cJuF9lHjF0kvas1nH7r77Nu9FK3V/8ujC+xmVmdUKr/R
        r5Ss6uflatjer8RSnJFoqMVcVJwIAO/TjJuIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWy7bCSvO4FB+54gznCFgfeH2SxeDBvG5vF
        /CPnWC06Z29gt1h6/SKTxbdjMRate4+wWxz88ITV4sjD3ewW2682sVq03DF14PZ4cnAek8ea
        eWsYPS739TJ5tBx5y+qxaVUnm0ffllWMHp83yQWwR3HZpKTmZJalFunbJXBldH9dyVowh7Pi
        3PdPrA2Mt9m7GDk5JARMJJ59/MAEYgsJ7GaUuPhZHCIuI/F8x1MWCFtYYuW/50D1XEA1TUwS
        56ZMYQVJsAloS2ybfhOsSEQgXmLO9n+MIEXMAmcYJZb/ug6WEBYIkOia9QNsG4uAqsSS+VuA
        4hwcvAK2EpMOlkAskJdYveEA8wRGngWMDKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3
        MYJDT0tzB+P2VR/0DjEycTAeYpTgYFYS4Y0W5YwX4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuj
        cGGckEB6YklqdmpqQWoRTJaJg1OqgSny/jpZ5pfOzSfvF39T7rg52XRyCpO/VunnY72PWWZY
        H9ih48X6qfYfg2bfFzuWlb3rnpy03dJ6tfXcBOGdahdmdExYJ7jG4dov7oPn7A8f0rTUqf3y
        jevGonf8Z43nsAr8usLoIeQ82yFtVW5HbvRSibfaZ3+63H7bOGci89+nfqpMr1h5gu45JVff
        nsIzPdJFNOj7n0N/diV9P/2ivibsb/EFJr6uHjWhSz8rhEw4H9ZqLf/WF/6k7+UjvfmPuXce
        yjKY9t7m1MPMGRt53QqbTSJW7usK9GfuvJbCsTfNsudwKcO6tRkVD45G1rnvmjzT+pfZXQv/
        q6J211i2HN7mP7t6341/nKVvNh0MswxQYinOSDTUYi4qTgQAGYqFfKwCAAA=
X-CMS-MailID: 20200712165648epcas5p3a1e6b9f9e1fdadc6740bc1eb509285f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20200712165648epcas5p3a1e6b9f9e1fdadc6740bc1eb509285f9
References: <CGME20200712165648epcas5p3a1e6b9f9e1fdadc6740bc1eb509285f9@epcas5p3.samsung.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds devicetree binding for perf/arm_smmuv3_pmu driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../bindings/perf/arm-smmu-v3-pmcg.txt        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm-smmu-v3-pmcg.txt

diff --git a/Documentation/devicetree/bindings/perf/arm-smmu-v3-pmcg.txt b/Documentation/devicetree/bindings/perf/arm-smmu-v3-pmcg.txt
new file mode 100644
index 000000000000..a20fe68ce149
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/arm-smmu-v3-pmcg.txt
@@ -0,0 +1,21 @@
+* ARM SMMU V3 PMCG
+
+Required properties:
+
+- compatible: should be "arm-smmu-v3-pmu"
+
+- reg: (standard registers property) physical address and size
+	of the performance counters registers block.
+	If Page 1 is present, specify the same.
+
+- interrupts: (standard interrupt property) single interrupt
+	generated by the SMMU PMU control block
+
+Example:
+
+	pmcg@20002000 {
+		compatible = "arm-smmu-v3-pmu";
+		reg = <0x0 0x20002000 0x0 0x1000>,
+			<0x0 0x20022000 0x0 0xE00>; /* Page 1 */
+		interrupts = <0 181 4>;
+	};
-- 
2.17.1

