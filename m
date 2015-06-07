From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 0/2] Fix oops in platform_device resource unregister
Date: Sun,  7 Jun 2015 15:20:09 +0100
Message-ID: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The register and unregister paths for platform_devices use different
tests to chose which resources to process. Register uses the value of
both parent & type, but unregister relies solely on type, which can
result in some resources not being unregistered, and an oops when an
unregistered resource is attempted to be removed. The oops issue is
particularly a problem for devicetree users because resources are not
registered in that path.

Add a test that exposes the problem for devicetree users, and then fix
the problem.
