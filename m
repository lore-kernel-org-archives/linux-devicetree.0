Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CDCC4CECE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 16:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EF1A206FA
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 16:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MrqD06Qh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCLQou (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 12:44:50 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33828 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgCLQog (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 12:44:36 -0400
Received: by mail-qk1-f194.google.com with SMTP id f3so7329855qkh.1
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ec7R0bi2nVM+F7rZN313cf7V1mbBY7UX4j8RKAtVudI=;
        b=MrqD06QhTj4HWofBJT7nxxIOwPRtSzDwxbA1IXIAZd+3Ka1QMh5FZbIGfKIWSR8h8X
         RuhrJagdGXsh+9vfSSTWITbjq4YzFxdkSVMCM6j7VKrnWPUc30Gb+4D77DX+SnDJ7Bqz
         Ig1o2b+WMvY/9fPKVhn5DyUTVxV96sih4P5gASQWiwy8cGlg0c0O38W6JEBKQASbDJyo
         P1VInXw4lJxd6FqY/dsvw4FNJUD2ziFu+Kxv2oGesiYBEA5SqBIn2nWZZ+LI9aJVQuFk
         o+HMBW4yav8ghIPKwdGWwcqKKVGPBmOVeUsmujGojgqCtuqZIbtyY2s4YMtl3YfypgpD
         J6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ec7R0bi2nVM+F7rZN313cf7V1mbBY7UX4j8RKAtVudI=;
        b=d4PPTnfrEBshte0EhyW7rN3AyZ2sBoYEhHpVbiz9Rr8wbwJXG9dPiANLysgh2TD1xl
         HdosZPNiFWgZjdy0eNZ5Z5MFzgo6JK0ffCmTV0+XHcYTr4Vq8ewMKKw+crV1vBc+Gamq
         NrFRIvS7t8/MNvNpxau5+FZ1iI3/d9TY0Wlid80nV/q+n4NnnquSCGiQM4HuG0eLJaG0
         GFvp7OqAoozYlpkwzFTwYMc32gOn4VuvMVPptf0B/LtqOfDav2EZX9HdSJKeSb0BJZ7W
         +oEIciD9jT2ImHic3LSGMBntMrX7mrPC/gVjKF23nhRaRI5RMQ+Ch+JyP1yze8gemvSJ
         MDkQ==
X-Gm-Message-State: ANhLgQ1kgpp/k+7HHIzG1YrbLgHl0Xz3lANK3zKmvsOQFMnqfufRk1Z3
        QRRUSkVTnFyACwsQz7YiVCJaOg==
X-Google-Smtp-Source: ADFU+vtioYETrA227Ha7YqY55Gh12iS6/cs2tK2mVB2+BbYDGinlbtWcnlzwX3ec9WHmb3gPZUx3ug==
X-Received: by 2002:a37:987:: with SMTP id 129mr8799401qkj.83.1584031475735;
        Thu, 12 Mar 2020 09:44:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id j4sm7244743qtn.78.2020.03.12.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:44:35 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     David Miller <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list),
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/2] bitfield.h: add FIELD_MAX() and field_max()
Date:   Thu, 12 Mar 2020 11:44:27 -0500
Message-Id: <20200312164428.18132-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164428.18132-1-elder@linaro.org>
References: <20200312164428.18132-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define FIELD_MAX(), which supplies the maximum value that can be
represented by a field value.  Define field_max() as well, to go
along with the lower-case forms of the field mask functions.

Signed-off-by: Alex Elder <elder@linaro.org>
Acked-by: Jakub Kicinski <kuba@kernel.org>
---
 include/linux/bitfield.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 4bbb5f1c8b5b..48ea093ff04c 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -55,6 +55,19 @@
 					      (1ULL << __bf_shf(_mask))); \
 	})
 
+/**
+ * FIELD_MAX() - produce the maximum value representable by a field
+ * @_mask: shifted mask defining the field's length and position
+ *
+ * FIELD_MAX() returns the maximum value that can be held in the field
+ * specified by @_mask.
+ */
+#define FIELD_MAX(_mask)						\
+	({								\
+		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
+		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
+	})
+
 /**
  * FIELD_FIT() - check if value fits in the field
  * @_mask: shifted mask defining the field's length and position
@@ -110,6 +123,7 @@ static __always_inline u64 field_mask(u64 field)
 {
 	return field / field_multiplier(field);
 }
+#define field_max(field)	((typeof(field))field_mask(field))
 #define ____MAKE_OP(type,base,to,from)					\
 static __always_inline __##type type##_encode_bits(base v, base field)	\
 {									\
-- 
2.20.1

