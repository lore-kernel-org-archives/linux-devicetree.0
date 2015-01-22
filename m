From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Add missing of_node_put() in of_find_node_by_path()
Date: Thu, 22 Jan 2015 16:18:32 +0000
Message-ID: <CACxGe6sDFQQfiN0+d5HV7JPE-0bosqdaKqrS-7o-obCy1NP_qg@mail.gmail.com>
References: <1421250356-16690-1-git-send-email-geert+renesas@glider.be> <20150122161446.101EBC40A80@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150122161446.101EBC40A80@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 22, 2015 at 4:14 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Wed, 14 Jan 2015 16:45:56 +0100
> , Geert Uytterhoeven <geert+renesas@glider.be>
>  wrote:
>> When traversing all nodes and moving to a new path component, the old
>> one must be released by calling of_node_put(). Else the refcounts of the
>> parent node(s) will not be decremented.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
[...]
>> Feel free to (ab)use the code below and derive a unittest from it...

BTW, can you do this please? They are pretty important for core
changes now, and I'm stuck with doing them if the person supplying a
patch does not (and I'm already too much of a bottleneck on the DT
code).

g.
