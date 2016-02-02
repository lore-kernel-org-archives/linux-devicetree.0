From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] scripts/dtc: Update to upstream commit b06e55c88b9b
Date: Tue, 02 Feb 2016 00:08:39 -0800
Message-ID: <56B06407.2030005@gmail.com>
References: <1453827959-11571-1-git-send-email-robh@kernel.org>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453827959-11571-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 1/26/2016 9:05 AM, Rob Herring wrote:
> Sync to upstream dtc commit b06e55c88b9b ("Prevent crash on modulo by
> zero"). This adds the following commits from upstream:
> 
> b06e55c Prevent crash on modulo by zero
> b433450 Fix some bugs in processing of line directives
> d728ad5 Fix crash on nul character in string escape sequence
> 1ab2205 Gracefully handle bad octal literals
> 1937095 Prevent crash on division by zero
> d0b3ab0 libfdt: Fix undefined behaviour in fdt_offset_ptr()
> d4c7c25 libfdt: check for potential overrun in _fdt_splice()
> f58799b libfdt: Add some missing symbols to version.lds
> af9f26d Remove duplicated -Werror in dtc Makefile
> 604e61e fdt: Add functions to retrieve strings
> 8702bd1 fdt: Add a function to get the index of a string
> 2218387 fdt: Add a function to count strings
> 554fde2 libfdt: fix comment block of fdt_get_property_namelen()
> e5e6df7 fdtdump: Fix bug printing bytestrings with negative values
> 067829e Remove redundant fdtdump test code
> 897a429 Move fdt_path_offset alias tests to right tests section
> 2d1417c Add simple .travis.yml
> f6dbc6c guess output file format
> 5e78dff guess input file format based on file content or file name
> 8b927bf tests: convert `echo -n` to `printf`
> 64c46b0 Fix crash with poorly defined #size-cells
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/dtc/checks.c                 |   2 +-
>  scripts/dtc/dtc-lexer.l              |  39 +++++++++-----
>  scripts/dtc/dtc-lexer.lex.c_shipped  | 101 +++++++++++++++++++----------------
>  scripts/dtc/dtc-parser.tab.c_shipped |  84 +++++++++++++++++------------
>  scripts/dtc/dtc-parser.y             |  20 ++++++-
>  scripts/dtc/dtc.c                    |  62 ++++++++++++++++++++-
>  scripts/dtc/libfdt/fdt.c             |  13 ++---
>  scripts/dtc/libfdt/fdt_ro.c          | 100 ++++++++++++++++++++++++++++++++++
>  scripts/dtc/libfdt/fdt_rw.c          |   2 +
>  scripts/dtc/libfdt/libfdt.h          |  73 +++++++++++++++++++++++--
>  scripts/dtc/util.c                   |   3 +-
>  scripts/dtc/version_gen.h            |   2 +-
>  12 files changed, 390 insertions(+), 111 deletions(-)
> 
> Generated from script, so just sending the diffstat and log for review.
> 
> Rob

Looks good to me.

I did not use your tree (based on 4.5-rc1) to test.  I instead based on
4.4 and did ./scripts/dtc/update-dtc-source.sh with the current dtc git
tree and verified the commits in the dtc tree matched the list above.

I compiled all of the .dts files in the Linux source tree.  I diffed the
resulting .dtb files against the .dtb files created before updating dtc.
There were no differences.

Tested-by: Frank Rowand <frank.rowand@sonymobile.com>

I visually inspected all of the commits you listed in the dtc tree.

Reviewed-by: Frank Rowand <frank.rowand@sonymobile.com>

-Frank
