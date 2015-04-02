From: Tim Bird <tbird20d@gmail.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Thu, 2 Apr 2015 11:11:31 -0700
Message-ID: <CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
	<CAK=WgbYw2cuPGC0cnd0qgYF8pa5Rbe7i+JN9fEpXfjz=gw-FQg@mail.gmail.com>
	<CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
	<CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 1, 2015 at 9:40 PM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> On Thu, Apr 2, 2015 at 12:32 AM, Tim Bird <tbird20d@gmail.com> wrote:
>> I didn't see an Ack from Mark or Rob.  But I did see a question from
>> Mark and response from Bjorn.
>>
>> Ohad - did you take this or are you still waiting for something?
>>
>> Who should I pester about this? :-)
>
> Sorry, I can't take this without a DT ack.

Hmmm.

The policy seems to be:
     "For driver (not subsystem) bindings: If you are comfortable with the
     binding, and it hasn't received an Acked-by from the devicetree
     maintainers after a few weeks, go ahead and take it."

The syscon property is only relative to the qcom hwspinlock driver,
(unless I'm missing something) and both Qualcomm and Sony devs are
OK with it.  So while an ACK from the DT side would be nice, I don't
think it's required.  This is exactly the type of delay that is really
holding up a lot of out-of-tree code.

But, in case that doesn't convince you...

Mark or Rob (or someone, anyone, over on the DT side)...

Can you please ACK or NAK the following binding?   This particular driver
is at the bottom of a very large dependency tree for out-of-tree code
for Qualcomm.

Thanks,
  -- Tim

---

Add binding documentation for the Qualcomm Hardware Mutex.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

I think the conclusion on the dt binding discussion for hwspinlocks was that
we're down to having the #hwlock-cells intact. So this version includes that,
but none of the other previously discussed properties.

Changes since v5:
- Extracted the dt binding documentation into a separate patch
- Moved the driver to consume a syscon
- Dropped previously suggested generic hwlock dt bindings

 .../devicetree/bindings/hwlock/qcom-hwspinlock.txt | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
new file mode 100644
index 0000000..28ade7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
@@ -0,0 +1,39 @@
+Qualcomm Hardware Mutex Block:
+
+The hardware block provides mutexes utilized between different processors on
+the SoC as part of the communication protocol used by these processors.
+
+- compatible:
+    Usage: required
+    Value type: <string>
+    Definition: must be one of:
+            "qcom,sfpb-mutex",
+            "qcom,tcsr-mutex"
+
+- syscon:
+    Usage: required
+    Value type: <prop-encoded-array>
+    Definition: one cell containing:
+            syscon phandle
+            offset of the hwmutex block within the syscon
+            stride of the hwmutex registers
+
+- #hwlock-cells:
+    Usage: required
+    Value type: <u32>
+    Definition: must be 1, the specified cell represent the lock id
+            (hwlock standard property, see hwlock.txt)
+
+Example:
+
+        tcsr: syscon@1a400000 {
+        compatible = "qcom,tcsr-msm8974", "syscon";
+        reg = <0xfd484000 0x2000>;
+    };
+
+    hwlock@fd484000 {
+        compatible = "qcom,tcsr-mutex";
+        syscon = <&tcsr 0 0x80>;
+
+        #hwlock-cells = <1>;
+    };
--
