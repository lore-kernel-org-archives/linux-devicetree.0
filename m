From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v7 2/2] backlight arcxcnn add support for ArcticSand
 devices
Date: Tue, 14 Mar 2017 10:16:30 +0000
Message-ID: <d628cdbc-dbc4-1065-23e8-63c0d6a2dd86@linaro.org>
References: <1489429323-6103-1-git-send-email-olimpiu@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489429323-6103-1-git-send-email-olimpiu@arcticsand.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olimpiu Dejeu <olimpiu@arcticsand.com>, robh@kernel.org
Cc: lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jingoohan1@gmail.com, bdodge@arcticsand.com, joe@perches.com, medasaro@arcticsand.com
List-Id: devicetree@vger.kernel.org

On 13/03/17 18:22, Olimpiu Dejeu wrote:
> backlight: Add support for Arctic Sand LED backlight driver chips
> This driver provides support for the Arctic Sand arc2c0608 chip,
>     and provides a framework to support future devices.
> Signed-off-by: Olimpiu Dejeu <olimpiu@arcticsand.com>

Please could you also submit a patch to add arc to
./Documentation/devicetree/bindings/vendor-prefixes.txt.

checkpatch.pl should have been asking you to do since v1 but only if you 
test the patch series against a clean kernel (tools such as aiaiai can 
help with this).

However, once that is attended to:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
