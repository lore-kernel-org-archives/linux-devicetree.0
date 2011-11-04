From: Pavan Kondeti <pkondeti@codeaurora.org>
Subject: USB support for device tree
Date: Fri, 04 Nov 2011 13:55:09 +0530
Message-ID: <4EB3A165.8060300@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

I am working on adding USB device tree support for MSM platform.  One of
our chip set has 2 hsusb cores. The first core is configured as otg and
the other core is configured in host only mode (EHCI compliant). Are the
below device node names Okay? Please suggest.

hsusb0-otg: usb@0xa6000000 {
	compatible = "qcom,hsusb-otg";
        ---
};

hsusb0-device: usb@0xa6000000 {
	compatible = "qcom,hsusb-device";
        ---
};

hsusb0-host: usb@0xa6000000 {
	compatible = "qcom,hsusb-host", "usb-ehci";
        ---
};

hsusb1-host: usb@0xa6000000 {
	compatible = "qcom,hsusb-host", "usb-ehci";
        ---
};

/* super speed support

ssusb0-device: usb@0xa6000000 {
	compatible = "qcom,ssusb-device";
};

*/

Thanks,
Pavan

-- 
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
