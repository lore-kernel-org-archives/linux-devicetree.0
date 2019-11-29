Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD824C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B49242176D
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfK2OQg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 09:16:36 -0500
Received: from foss.arm.com ([217.140.110.172]:48290 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfK2OQg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 Nov 2019 09:16:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1AC1FB;
        Fri, 29 Nov 2019 06:16:35 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D18E03F52E;
        Fri, 29 Nov 2019 06:16:34 -0800 (PST)
Subject: Re: [PATCH v5 07/14] coresight: cti: Add device tree support for
 custom CTI.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-8-mike.leach@linaro.org> <20191125212258.GB18542@xps15>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <35357ff3-2b1e-764e-cfbd-65bcc7a4faa6@arm.com>
Date:   Fri, 29 Nov 2019 14:16:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125212258.GB18542@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 25/11/2019 21:22, Mathieu Poirier wrote:
> On Tue, Nov 19, 2019 at 11:19:05PM +0000, Mike Leach wrote:
>> Adds support for CTIs whose connections are implementation defined at
>> hardware design time, and not constrained by v8 architecture.
>>
>> These CTIs have no standard connection setup, all the settings have to
>> be defined in the device tree files. The patch creates a set of connections
>> and trigger signals based on the information provided.
>>
>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>> ---
>>   .../coresight/coresight-cti-platform.c        | 250 +++++++++++++++++-
>>   .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
>>   2 files changed, 257 insertions(+), 4 deletions(-)

>> +static int cti_plat_create_impdef_connections(struct device *dev,
>> +					      struct cti_drvdata *drvdata)
>> +{
>> +	int rc = 0;
>> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>> +	struct fwnode_handle *child = NULL;
>> +
>> +	if (IS_ERR_OR_NULL(fwnode))
>> +		return -EINVAL;
>> +
>> +	fwnode_for_each_child_node(fwnode, child) {
>> +		if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
>> +			rc = cti_plat_create_connection(dev, drvdata, child);
>> +		if (rc != 0)
>> +			break;
>> +	}
>> +	fwnode_handle_put(child);
> 
> As far as I can tell we don't need to call fwnode_handle_put()?

Actually we do, if we break the scan in between, at least for of_nodes.
I had to literally look it down all the way down to confirm this.

So for CONFIG_OF it ends up in of_get_next_available_child(), which
drops the ref on "prev" and grabs the "next". So in case we break
the loop, we must drop the ref on the child. Otherwise, the last
result would be NULL, which would have dropped the ref on the "last"
valid entry. And this is harmless with a NULL ptr.

Suzuki
