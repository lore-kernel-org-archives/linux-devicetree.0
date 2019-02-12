From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 0/1] of: unittest: unflatten device tree on UML when testing
Date: Tue, 12 Feb 2019 10:53:04 -0800
Message-ID: <20190212185305.112847-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

This patch set unflattens device trees when running DT's unittest. It is
a follow up to
https://www.spinics.net/lists/linux-kselftest/msg05454.html part of the
KUnit RFC v3 thread
(https://www.spinics.net/lists/linux-kselftest/msg05431.html). Rob asked
me to submit this patch separately along with some modifications.

-- 
2.20.1.791.gb4d0f1c61a-goog
