From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: How to represent negative values for device tree property
Date: Mon, 01 Apr 2013 16:00:47 -0600
Message-ID: <515A038F.2090902@wwwdotorg.org>
References: <5159F760.1080605@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5159F760.1080605@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/01/2013 03:08 PM, David Collins wrote:
> Hi,
> 
> I am working on a thermal driver which needs to be able to read a
> temperature threshold from a device tree property.  The hardware supports
> thresholds in the range -204.8 to +204.7 C in 0.1 C steps.  I have found,
> as I am sure others have as well, that dtc treats a '-' before an integer
> in a dtsi file as a syntax error.  Therefore, I need some artificial way
> to represent negative numbers in device tree.  Here are the possibilities
> that I have thought of so far:

Doesn't the very latest dtc, which contains integer expression support,
allow unary -? I thought that code had been imported into the kernel
(goes and checks) yes it has. What's the error you're seeing;
over/underflow or syntax?

That said, DT cells are supposed to be u32 not s32, so perhaps this
isn't unexpected.
