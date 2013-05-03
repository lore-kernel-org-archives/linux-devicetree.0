From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] clk: si5351: Allow user to define disabled state for
 every clock output
Date: Fri, 03 May 2013 12:02:02 +0200
Message-ID: <51838B1A.4010803@gmail.com>
References: <1367559207-20086-1-git-send-email-marek.belisko@streamunlimited.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367559207-20086-1-git-send-email-marek.belisko@streamunlimited.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Belisko <marek.belisko@gmail.com>
Cc: mturquette@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, daniel@zonque.org, vladimir.koutny@streamunlimited.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Belisko <marek.belisko@streamunlimited.com>
List-Id: devicetree@vger.kernel.org

On 05/03/2013 07:33 AM, Marek Belisko wrote:
> From: Sebastian Hesselbarth<sebastian.hesselbarth@gmail.com>
>
> This patch adds platform data and DT bindings to allow to overwrite
> the stored disabled state for each clock output.
>
> Signed-off-by: Marek Belisko<marek.belisko@streamunlimited.com>
> Signed-off-by: Sebastian Hesselbarth<sebastian.hesselbarth@gmail.com>
> ---
> Changes from v1->v2:
> Sebastian Hesselbarth send me updated version of patch which was based
> on v1. Resending with updates.

Marek,

it is ok to be a little bit more noisy about changes. But as I took
your v1 and did it, here is the Changelog:

- add helper to set disabled state for clkout
- make disabled-state property behave like other properties, i.e.
   only overwrite disabled state when set through platform_data or DT

Sebastian
