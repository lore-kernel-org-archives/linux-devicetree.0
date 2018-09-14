From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 3/3] scripts/dtc: Update to upstream version
 v1.4.7-14-gc86da84d30e4
Date: Fri, 14 Sep 2018 14:32:43 -0700
Message-ID: <f9684222-fae0-c305-d48a-be77ebb985a3@gmail.com>
References: <20180913202828.15372-1-robh@kernel.org>
 <20180913202828.15372-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913202828.15372-3-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 09/13/18 13:28, Rob Herring wrote:
> Major changes are I2C and SPI bus checks, YAML output format (for
> future validation), some new libfdt functions, and more libfdt
> validation of dtbs.
> 
> The YAML addition adds an optional dependency on libyaml. pkg-config is
> used to test for it and pkg-config became a kconfig dependency in 4.18.

For Ubuntu, the libyaml dependency is provided by the packages:

   libyaml-0-2
   libyaml-dev


-Frank

> 
> This adds the following commits from upstream:
> 
> c86da84d30e4 Add support for YAML encoded output
> 361b5e7d8067 Make type_marker_length helper public


< snip >
